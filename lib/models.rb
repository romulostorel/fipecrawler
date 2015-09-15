module Models
  class Brand < Sequel::Model
    set_allowed_columns :id, :name

    one_to_many :vehicles
  end

  class Vehicle < Sequel::Model
    set_allowed_columns :id, :name, :brand_id

    many_to_one :brand
    one_to_many :vehicle_years
  end

  class VehicleYear < Sequel::Model
    set_allowed_columns :id, :label, :value, :vehicle_id

    many_to_one :vehicle
  end
end
