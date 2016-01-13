source 'https://rubygems.org'

#This is required for deploy to heroku
#ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use MySql legacy database
gem 'mysql2', group: :development
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# This gem is required for heroku dpeloy
#gem 'rails_12factor'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Flexible authentication solution for Rails with Warden
gem 'devise'

# I18n
gem 'rails-i18n'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn', group: :production

# Capistrano for deployment
gem 'capistrano', '~> 3.1'
gem 'capistrano-rails', '~> 1.1'
gem 'capistrano-rvm'

# Activeadmin
gem 'activeadmin', github: 'activeadmin'

# HTML Abstraction Markup Language
gem 'haml'

# Bootstrap for Sass
gem 'bootstrap-sass', '~> 3.3.5'

# Sprockets Rails integration
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'sprockets'

# Icons
gem 'font-awesome-sass', '~> 4.4.0'

# Ajax synchronizate datatables
gem 'jquery-datatables-rails'
gem 'ajax-datatables-rails'
gem 'kaminari'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Print rails objects in the cool way
  gem "awesome_print", require:"ap"

  # This is very usefull for rails panel extension of google chrome
  gem 'meta_request'

  # Better error page for Rack apps
  gem "better_errors"

  # Take off assets in rails console
  gem 'quiet_assets'

  # Haml generators for Rails 4
  gem "haml-rails", "~> 0.9"

  # For live reload chrome extension
  gem 'rb-fsevent'
  gem 'guard-livereload'

  # Profiler for your development and production Ruby rack apps.
  gem 'rack-mini-profiler'

  # A very fast & simple Ruby web server.
  gem 'thin'
end

