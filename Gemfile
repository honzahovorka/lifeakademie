source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'fancybox2-rails', '~> 0.2.4'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-readline', require: false
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'terminal-notifier-guard'
  gem 'capybara'
  gem 'forgery'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
  # gem 'pry-rails'
  gem 'awesome_print'
end

group :production do
  gem 'pg'
  gem 'heroku-deflater'
  gem 'rails_12factor'
end

group :test do
  gem 'factory_girl_rails', '~> 4.0'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
  gem 'database_cleaner'
end

gem 'bcrypt-ruby', require: 'bcrypt'

gem "paperclip", "~> 3.0"
gem 'ckeditor_rails'

# JavasScript libs
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'modernizr-rails'

gem 'newrelic_rpm'

# Webserver
gem 'puma'
gem 'thin'
