# frozen_string_literal: true

source 'https://rubygems.org'

gem 'dotenv', '~> 2.7'
gem 'haml', '~> 5.0'
gem 'json-jwt', '1.10.0'
gem 'mail', '~> 2.7'
gem 'puma', group: :production
gem 'rspec-core', '~> 3.8', group: :test
gem 'sinatra', '~> 2.0'
gem 'yard', group: :doc

group :development do
  gem 'guard', '~> 2.15'
  gem 'guard-rack', '~> 2.2'
end
