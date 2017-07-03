# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# RVM support for Capistrano v3
require 'capistrano/rvm'

# Bundler support for Capistrano 3.x
require 'capistrano/bundler'

# Ruby on Rails specific tasks for Capistrano
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

# Integrates Unicorn tasks into capistrano deployment scripts
require 'capistrano3/unicorn'

# Load custom tasks from `lib/capistrano/tasks' if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
