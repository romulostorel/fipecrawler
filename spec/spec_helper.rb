require 'fipe_crawler.rb'
require 'database_cleaner'
require 'webmock'
require 'vcr'
require 'simplecov'

SimpleCov.start

Dir["./spec/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
