source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '~> 4.0.0'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby', require: 'bcrypt'
gem "paperclip", "~> 3.0"

# JavasScript libs
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'modernizr-rails'
gem 'jquery-turbolinks'
gem 'nprogress-rails'
gem 'fancybox2-rails', '~> 0.2.4'
gem 'ckeditor_rails'

# Profiling
gem 'rack-mini-profiler'

# Monitoring
gem 'newrelic_rpm'

# Webserver
gem 'puma'
gem 'thin'

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
  gem 'pry-rails'
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
