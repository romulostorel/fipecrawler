require 'catcher/vehicle'

class Importer::Vehicle
  attr_accessor :catcher, :model, :parser

  def initialize
    self.catcher = Catcher::Vehicle
    self.model = Models::Vehicle
    self.parser = Parser::Vehicle
  end

  def self.import
    new.import
  end

  def import
    create_vehicles
  end

  protected

  def create_vehicles
    Models::Brand.all.each do |brand|
      catch_and_parse_vehicles(brand.id).each do |vehicle|
        model.create(vehicle)
      end
    end
  end

  def catch_and_parse_vehicles(brand_id)
    parser.parse(catcher.catch(brand_id))
  end
end
