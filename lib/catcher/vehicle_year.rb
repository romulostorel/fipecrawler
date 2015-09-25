require 'net/http'

class Catcher::VehicleYear
  def initialize(reference, brand_id, vehicle_id, type)
    @reference = reference
    @brand_id = brand_id
    @vehicle_id = vehicle_id
    @type = type
  end

  def self.catch(reference:, brand_id:, vehicle_id:, type:)
    new(reference, brand_id, vehicle_id, type).catch
  end

  def catch
    vehicle_years
  end

  private

  def vehicle_years
    get_and_parse_json
  end

  def get_json
    post(params: { 'codigoTabelaReferencia' => @reference, 'codigoMarca' => @brand_id,
      'codigoModelo' => @vehicle_id, 'codigoTipoVeiculo' => @type } ).body.force_encoding("UTF-8")
  end

  def get_and_parse_json
    JSON.parse(get_json)
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
    URI('http://www.fipe.org.br/IndicesConsulta-ConsultarAnoModelo')
  end

  def referer
    'http://www.fipe.org.br/pt-br/indices/veiculos/'
  end
end
