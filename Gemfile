# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.6'

# Databases
gem 'pg', '~> 1.1'

# Linters
gem 'rubocop', require: false

# CRM's Data Syncs
gem 'hubspot-api-client'

# Others
gem 'active_model_serializers'

# Defaults
gem 'bootsnap', require: false
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]


group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'

  gem 'dotenv-rails'
end

group :development do
end
