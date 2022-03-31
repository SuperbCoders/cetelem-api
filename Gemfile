# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use postgresql as the database for Active Record
gem 'dotenv-rails'
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3.12'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'active_model_serializers'
gem 'will_paginate'
gem 'api-pagination'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'jwt_sessions'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Activerecord import libraty
gem 'activerecord-import'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# for backgroud jobs
gem 'sidekiq'

# for xls export
gem 'spreadsheet'

# detect user location
gem 'geocoder'

# for http requests
gem 'typhoeus'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-json_expectations'
  gem 'rubocop'

  # rails 6 has bug with rspec, https://github.com/rspec/rspec-rails/issues/2177
  # gem 'rspec-rails'
  gem 'rspec-rails', '4.0.0.beta3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
# # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
