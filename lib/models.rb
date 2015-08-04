module Models
  class Brand
    include DataMapper::Resource

    property :id,        Serial
    property :name,      String
    property :value,     Integer
  end

  DataMapper.finalize
end
