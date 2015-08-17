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
    vehicles.each do |vehicle|
      create_vehicle(vehicle[:name], vehicle[:id], vehicle[:brand_id])
    end
  end

  def create_vehicle(name, id, brand_id)
    model.create(name: name, id: id, brand_id: brand_id)
  end

  def vehicles
    parser.parse(catcher.catch)
  end
end
