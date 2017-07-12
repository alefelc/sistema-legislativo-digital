## STAGING UNICORN SETTINGS FILE ##

## == Path to application.
root = File.expand_path "../..", __FILE__
working_directory root

## == Master PID location.
pid "#{root}/tmp/pids/unicorn.pid"

## == Unicorn options.
worker_processes 2
timeout 30
preload_app true

## == Set up socket location.
listen "/tmp/unicorn.sld_staging.sock", backlog: 64
## Probably this line must be removed.
listen "127.0.0.1:9999", :tcp_nopush => true

## == Log file.
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

## == Callbacks.
## Missing description HERE!!!!
before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined? ActiveRecord::Base and ActiveRecord::Base.connection.disconnect!
end

## Missing description HERE!!!!
after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined? ActiveRecord::Base and ActiveRecord::Base.establish_connection
end

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink.
before_exec do |_|
  ENV['BUNDLE_GEMFILE'] = File.join root, 'Gemfile'
end
