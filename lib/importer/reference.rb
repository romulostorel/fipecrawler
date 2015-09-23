require 'parser/reference'

class Importer::Reference
  attr_accessor :parser, :model

  def initialize
    self.parser = Parser::Reference
    self.model = Models::Reference
  end

  def self.import
    new.import
  end

  def import
    create_references
  end

  def create_references
    parser.references.each do |reference|
      model.create(reference)
    end
  end
end
