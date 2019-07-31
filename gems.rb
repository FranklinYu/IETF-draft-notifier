# frozen_string_literal: true

source 'https://rubygems.org'

gem 'dotenv', '~> 2.7'
gem 'haml', '~> 5.1'
gem 'json-jwt', '1.10.2'
gem 'mail', '~> 2.7'
gem 'rake'
gem 'sinatra', '~> 2.0'
gem 'sinatra-activerecord', '~> 2.0'
gem 'yard', group: :doc

group :development, :test do
  gem 'faker', '~> 2.0'
  gem 'sqlite3'
end

group :development do
  gem 'guard', '~> 2.15'
  gem 'guard-rack', '~> 2.2'
  gem 'guard-rspec', '~> 4.7'
end

group :test do
  gem 'rspec', '~> 3.8'
  gem 'rspec_junit_formatter'
end

group :production do
  gem 'pg'
  gem 'puma'
end
