require 'net/http'
require 'pry'

class Catcher::Vehicle
  attr_accessor :brand_id

  def initialize(brand_id)
    self.brand_id = brand_id
  end

  def self.catch(brand_id)
    new(brand_id).catch
  end

  def catch
    vehicles
  end

  protected

  def brand
    @brand ||= Models::Brand[brand_id]
  end

  def vehicles
    get_and_parse_json
  end

  def get_json
    post(params: { 'codigoTabelaReferencia' => 182, 'codigoTipoVeiculo' => 1, 'codigoMarca' => brand_id } ).body.force_encoding("UTF-8")
  end

  def get_and_parse_json
    JSON.parse(get_json).merge(brand_id: brand_id)
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
