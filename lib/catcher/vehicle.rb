require 'net/http'
require 'pry'

class Catcher::Vehicle
  attr_accessor :brands

  def initialize
    self.brands = Models::Brand.all
  end

  def self.catch
    new.catch
  end

  def catch
    vehicles
  end

  protected

  def vehicles
    brands.map{|b| get_json(b.id)}
  end

  def get_json(brand_id)
    JSON.parse(post(params: { 'codigoTabelaReferencia' => 182, 'codigoTipoVeiculo' => 1, 'codigoMarca' => brand_id } ).body.force_encoding("UTF-8")).merge(:brand_id => brand_id)
  end

  def post(params:)
    Net::HTTP.post_form(uri, params)
  end

  def uri
    URI('http://www.fipe.org.br/IndicesConsulta-ConsultarModelos')
  end
end
