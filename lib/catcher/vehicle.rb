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
    brands.map{|b| parse_json(b.id)}
  end

  def get_json(brand_id)
    post(params: { 'codigoTabelaReferencia' => 182, 'codigoTipoVeiculo' => 1, 'codigoMarca' => brand_id } ).body.force_encoding("UTF-8")
  end

  def parse_json(brand_id)
    JSON.parse(get_json(brand_id)).merge(:brand_id => brand_id)
  end

  def post(params:)
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data(params)
    req['Referer'] = referer
    req['User-Agent'] = FipeCrawler::USER_AGENT
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
  end

  def uri
    URI('http://www.fipe.org.br/IndicesConsulta-ConsultarModelos')
  end

  def referer
    'http://www.fipe.org.br/pt-br/indices/veiculos/'
  end
end
