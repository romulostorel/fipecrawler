module Models
  class Brand
    include DataMapper::Resource

    property :id,        Integer, key: true
    property :name,      String
  end

  class Vehicle
    include DataMapper::Resource

    property :id,        Integer, key: true
    property :name,      String
    property :brand_id,  Integer
  end

  DataMapper.finalize
  DataMapper.auto_migrate!
end
