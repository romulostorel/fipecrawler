module Models
  class Brand < Sequel::Model
  end

  class Vehicle < Sequel::Model
    def brand
      Brand[brand_id]
    end
  end
end

Models::Brand.set_allowed_columns :id, :name
Models::Vehicle.set_allowed_columns :id, :name, :brand_id
