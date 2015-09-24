require 'open-uri'
require 'nokogiri'

class Parser::Reference
  def self.references
    new.references
  end

  def references
    data_hash
  end

  private

  def get_all_elements
    parse_web
    .css('#selectTabelaReferenciacarro')
    .children
  end

  def cleaned_elements
    get_all_elements.select do |element|
      element if element.class.eql? Nokogiri::XML::Element
    end
  end

  def data_hash
    cleaned_elements.map do |element|
      {
        label: element.children.text.strip,
        code: element.attributes['value'].value.to_i
      }
    end
  end

  def parse_web
    Nokogiri::HTML open referer
  end

  def referer
    'http://www.fipe.org.br/pt-br/indices/veiculos/'
  end
end
