class Parser::VehicleYear
  def initialize(vehicle_id, vehicle_year_hash)
    @vehicle_year_hash = vehicle_year_hash
    @vehicle_id = vehicle_id
  end

  def self.parse(vehicle_id:, vehicle_year_hash:)
    new(vehicle_id, vehicle_year_hash).parse
  end

  def parse
    @vehicle_year_hash.map do |vehicle_year|
      {
        label: vehicle_year['Label'],
        value: vehicle_year['Value'].split('-').first.to_i,
        vehicle_id: @vehicle_id
      }
    end
  end
end
