max_threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
threads min_threads_count, max_threads_count

port        3000
environment 'development'
pidfile     'tmp/pids/server.pid'

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
