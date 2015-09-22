require 'net/http'
require 'pry'

class Catcher::Vehicle
  def initialize(brand_id, type, reference)
    @brand_id = brand_id
    @type = type
    @reference = reference
  end

  def self.catch(brand_id:, type:, reference:)
    new(brand_id, type, reference).catch
  end

  def catch
    vehicles
  end

  protected

  def brand
    @brand ||= Models::Brand[@brand_id]
  end

  def vehicles
    get_and_parse_json
  end

  def get_json
    post(params: { 'codigoTabelaReferencia' => @reference, 'codigoTipoVeiculo' => @type, 'codigoMarca' => @brand_id } ).body.force_encoding("UTF-8")
  end

  def get_and_parse_json
    JSON.parse(get_json).merge(brand_id: @brand_id)
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
