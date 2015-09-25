require 'catcher/vehicle_year'
require 'parser/vehicle_year'

class Importer::VehicleYear
  def initialize(reference, brand_id, vehicle_id, type)
    @reference = reference
    @brand_id = brand_id
    @vehicle_id = vehicle_id
    @type = type

    @model = Models::VehicleYear
    @catcher = Catcher::VehicleYear
    @importer = Importer::VehicleYear
    @parser = Parser::VehicleYear
  end

  def self.import(reference:, brand_id:, vehicle_id:, type:)
    new(reference, brand_id, vehicle_id, type).import
  end

  def import
    create_vehicle_years
  end

  private

  def create_vehicle_years
    catch_and_parse_vehicle_years(@reference, @brand_id, @vehicle_id, @type).each do |vehicle_year|
      @model.create(vehicle_year)
    end
  end

  def catch_and_parse_vehicle_years(reference, brand_id, vehicle_id, type)
    @parser.parse(
      vehicle_id: @vehicle_id,
      vehicle_year_hash: @catcher.catch(reference: reference, brand_id: brand_id, vehicle_id: vehicle_id, type: type)
    )
  end
end
