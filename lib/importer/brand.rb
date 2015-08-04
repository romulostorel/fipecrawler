require 'catcher/brand'

class Importer::Brand
  attr_accessor :catcher, :model

  def initialize
    self.catcher = Catcher::Brand
    self.model = Models::Brand
  end

  def self.import
    new.import
  end

  def import
    create_brands
  end

  protected

  def create_brands
    brands.each do |brand|
      create_brand(brand['Label'], brand['Value'])
    end
  end

  def create_brand(name, value)
    model.create(name: name, value: value)
  end

  def brands
    JSON.parse(catcher.catch)
  end
end
