source 'https://rubygems.org'

gem 'dotenv'
gem 'sequel'

gem 'rspec'
gem 'simplecov', require: false
gem 'pry'
gem 'nokogiri'

platforms :jruby do
  group :development, :production do
    gem 'jdbc-postgres'
  end

  group :test do
    gem 'jdbc-sqlite3'
  end
end

platforms :ruby do
  gem 'pry-byebug'

  group :development, :production do
    gem 'pg'
  end

  group :test do
    gem 'sqlite3'
  end
end

group :test do
  gem 'vcr'
  gem 'webmock'
end
