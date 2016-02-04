# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Official Ruby on Rails specific tasks for Capistrano
require 'capistrano/rails'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Official Bundler specific tasks for Capistrano
require 'capistrano/bundler'

# Official RVM specific tasks for Capistrano
require 'capistrano/rvm'

# Load console
require 'capistrano/rails/console'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
Dir.glob('lib/capistrano/**/*.rb').each { |r| import r }
