require 'catcher/vehicle'

class Importer::Vehicle
  def initialize(type:, reference:)
    @type = type
    @reference = reference
    @catcher = Catcher::Vehicle
    @model = Models::Vehicle
    @parser = Parser::Vehicle
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
      catch_and_parse_vehicles(brand.id, @type, @reference).each do |vehicle|
        @model.create(vehicle)
      end
    end
  end

  def catch_and_parse_vehicles(brand_id, type, reference)
    @parser.parse(@catcher.catch(brand_id: brand_id, type: type, reference: reference))
  end
end
