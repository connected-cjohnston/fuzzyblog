source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.1'

gem 'active_storage_validations'
gem 'aws-sdk-s3', require: false
gem 'clearance'
gem 'image_processing', '~> 1.12'
gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'redcarpet'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.2'
end

group :development do
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  gem 'capistrano', '~> 3.14', require: false
  gem 'capistrano-rails', '~>1.6.1', require: false
  gem 'capistrano-rbenv', '~>2.2.0', require: false
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'htmlbeautifier'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'solargraph'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
