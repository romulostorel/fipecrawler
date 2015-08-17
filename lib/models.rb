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
    belongs_to :brand
  end

  DataMapper.finalize
  DataMapper.auto_migrate!
end
