max_threads_count = ENV.fetch('PUMA_MAX_THREADS') { 5 }
min_threads_count = ENV.fetch('PUMA_MIN_THREADS') { max_threads_count }
threads min_threads_count, max_threads_count

app_dir = '/var/app/current'

bind            "unix://#{app_dir}/tmp/sockets/puma.sock"
environment     'production'
pidfile         "#{app_dir}/tmp/pids/puma.pid"
stdout_redirect "#{app_dir}/log/puma-stdout.log", "#{app_dir}/log/puma-stderr.log", true
workers         ENV.fetch('PUMA_WORKERS') { 2 }
preload_app!
