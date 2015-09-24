require 'net/http'

class Catcher::VehiclePrice
  def initialize(reference, brand_id, model_id, type, model_year, fuel_type_id)
    @reference = reference
    @brand_id = brand_id
    @model_id = model_id
    @type = type
    @model_year = model_year
    @fuel_type_id = fuel_type_id
  end

  def self.catch(reference:, brand_id:, model_id:, type:, model_year:, fuel_type_id:)
    new(reference, brand_id, model_id, type, model_year, fuel_type_id).catch
  end

  def catch
    vehicle_price
  end

  protected

  def vehicle_price
    get_and_parse_json
  end

  def get_json
    post(params: { 'codigoTabelaReferencia' => @reference, 'codigoMarca' => @brand_id,
      'codigoModelo' => @model_id, 'codigoTipoVeiculo' => @type, 'anoModelo' => @model_year,
      'codigoTipoCombustivel' => @fuel_type_id, } ).body.force_encoding("UTF-8")
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
    URI('http://www.fipe.org.br/IndicesConsulta-ConsultarValorComTodosParametros')
  end

  def referer
    'http://www.fipe.org.br/pt-br/indices/veiculos/'
  end
end
