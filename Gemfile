source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.5.2'
gem 'sidekiq'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'
gem 'devise'
gem 'figaro'
gem 'pg'
gem 'puma'
gem 'simple_form'
gem 'slim-rails'
gem 'devise-bootstrap-views'

group :development do
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec' # Tests preloader
  gem 'terminal-notifier-guard' # Notifications
  gem 'terminal-notifier' # Notifications
  gem 'binding_of_caller' # Retrieve the binding of a method's caller
  gem 'letter_opener' # Preview letters
  gem 'bullet' # Prevent N+1 queries

  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rails', require: false
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'guard-brakeman'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard-webpack'
end

group :development, :test do
  gem 'factory_girl_rails' # Test factories
  gem 'faker'
  gem 'pry-rails' # Rails console
  gem 'pry-rescue' # Pry helper
  gem 'pry-bloodline' # Pry theme
  gem 'awesome_print' # Print colors
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'byebug'
end

group :test do
  gem 'launchy' # Launch tests
  gem 'simplecov', require: false # Tests coverage
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1' # RSpec-compatible one-liners
  gem 'email_spec' # Email testing
end
