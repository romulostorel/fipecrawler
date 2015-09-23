ENV['DATABASE_URL'] = case RUBY_ENGINE
                      when 'jruby'
                        'jdbc:sqlite::memory:'
                      when 'ruby'
                        'sqlite:/'
                      end

Dir["./spec/support/**/*.rb"].each { |f| require f }

require './lib/fipe_crawler'

RSpec.configure do |config|
  config.around(:each) do |example|
    Models::VehicleYear.dataset.destroy
    Models::Vehicle.dataset.destroy
    Models::Brand.dataset.destroy
    Models::Reference.dataset.destroy
    #
    # TODO
    #
    # Maybe a good idea we run tests to all databases.
    #
    # To run with postgresql:
    #
    #     $db.run 'TRUNCATE TABLE brands'
    #     $db.run 'TRUNCATE TABLE vehicles'
    example.run
  end
end
