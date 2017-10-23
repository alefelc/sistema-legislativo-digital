# Load DSL and set up stages
require 'capistrano/setup'

# Lets have some console loveliness
require "capistrano/console"

# Include default deployment tasks
require 'capistrano/deploy'

# RVM support for Capistrano v3
require 'capistrano/rvm'

# Bundler support for Capistrano 3.x
require 'capistrano/bundler'

# Ruby on Rails specific tasks for Capistrano
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

# Load custom tasks from `lib/capistrano/tasks' if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
Dir.glob('lib/capistrano/**/*.rb').each { |r| import r }
