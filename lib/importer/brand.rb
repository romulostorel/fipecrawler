require 'catcher/brand'

class Importer::Brand
  def initialize(type:, reference:)
    @type = type
    @reference = reference
    @catcher = Catcher::Brand.new(type: @type, reference: @reference)
    @model = Models::Brand
  end

  def self.import(type, reference)
    new(type: type, reference: 182).import
  end

  def import
    create_brands
  end

  protected

  def create_brands
    brands.each do |brand|
      @model.create(
        id: brand['Value'],
        name: brand['Label'],
        type: @type
      )
    end
  end

  def brands
    JSON.parse(@catcher.catch)
  end
end
