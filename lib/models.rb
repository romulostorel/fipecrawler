module FipeCrawler
  module Models
    class Brand
      include DataMapper::Resource

      property :id,        Serial
      property :name,      String
    end

    DataMapper.finalize
  end
end


