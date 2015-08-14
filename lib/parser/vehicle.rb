class Parser::Vehicle
  attr_accessor :vehicle_hash

  def initialize(vehicle_hash)
    self.vehicle_hash = vehicle_hash
  end

  def self.parse(vehicle_hash)
    new(vehicle_hash).parse
  end

  def parse
    vehicles = []

    vehicle_hash.each do |brand|
      brand['Modelos'].each do |vehicle|
        vehicles << {id: vehicle['Value'], name: vehicle['Label'], brand_id: brand[:brand_id]}
      end
    end

    vehicles
  end
end
