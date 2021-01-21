namespace :db do
  task :drop_if_exists do
    database = Rails.application.config_for(:database)['database']
    if `psql -lAqt | cut -d '|' -f 1 | grep -w #{database} | wc -l`.strip == '1'
      Rake::Task['db:drop'].invoke
    else
      puts "cannot drop #{database} because it does not exist"
    end
  end

  task :rebuild => %i(db:drop_if_exists db:create db:migrate db:seed)

  task dump: :environment do
    database = Rails.application.config_for(:database)['database']
    file = "#{database}_#{Time.now.strftime('%Y%m%d%H%M%S')}.sql"
    puts "dumping #{file} from #{database}"
    sh ". #{Rails.root}/.env.#{Rails.env} && PGPASSWORD=\"$RAILS_DB_PASSWORD\" pg_dump -O -x -f #{file} -h $RAILS_DB_HOST -U $RAILS_DB_USERNAME #{database}"
  end

  task restore: :environment do
    database = Rails.application.config_for(:database)['database']
    file = ARGV[1]&.dup || `ls -t1 *.sql | head -n 1`.chop
    raise 'no file' if file.blank?

    puts "restoring #{file} to #{database}"
    Rake::Task['db:drop_if_exists'].invoke
    Rake::Task['db:create'].invoke
    sh ". #{Rails.root}/.env.#{Rails.env} && PGPASSWORD=\"$RAILS_DB_PASSWORD\" psql -f #{file} -h $RAILS_DB_HOST -U $RAILS_DB_USERNAME -d #{database}"
    Rake::Task['db:migrate'].invoke
  end
end
