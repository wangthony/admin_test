overrides_dir = Rails.root.join('app', 'overrides').to_s
Rails.autoloaders.main.ignore overrides_dir
Rails.application.config.to_prepare do
  Dir.glob("#{overrides_dir}/**/*.rb").each do |override|
    load override
  end
end
