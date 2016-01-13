# If the environment differs from the stage name
set :rails_env, 'production'

# Defaults to 'db'
set :migration_role, 'migrator'

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to [:web]
set :assets_roles, [:app]

# Defaults to 'assets'
# This should match config.assets.prefix in your rails config/application.rb
set :assets_prefix, 'prepackaged-assets'

# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets}

# Defaults to nil (no asset cleanup is performed)
# If you use Rails 4+ and you'd like to clean up old assets after each deploy,
# set this to the number of versions to keep
set :keep_assets, 2


lock '3.4.0'

set :application, 'sld_new'
set :repo_url, 'git@github.com:jlgasparrini/sistema-legislativo-digital.git'

# Default branch is :master
set :branch, 'develop'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :use_sudo, false

set :bundle_binstubs, nil

set :linked_files, fetch(:linked_files, []).push('config/database.yml')

set :linked_dirs, fetch(:linked_dirs, []).push('shared/log', 'shared/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'

set(:config_files, %w(
   unicorn.rb
   unicorn_init.sh
))

set(:executable_config_files, %w(
  unicorn_init.sh
))

set(:symlinks, [
  {
  source: "unicorn_new_init.sh",
  link: "/etc/init.d/unicorn_sld_new"
  }
])

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
