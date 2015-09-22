module Models
  class Brand < Sequel::Model
    set_allowed_columns :id, :name, :type

    one_to_many :vehicles
  end

  class Vehicle < Sequel::Model
    set_allowed_columns :id, :name, :brand_id, :type

    many_to_one :brand
  end
end
