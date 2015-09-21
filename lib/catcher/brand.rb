require 'net/http'

class Catcher::Brand
  def initialize(type:, reference:)
    @type = type
    @reference = reference
  end

  def self.catch
    new.catch
  end

  def catch
    get_json
  end

  protected

  def get_json
    post(params: {'codigoTabelaReferencia' => @reference, 'codigoTipoVeiculo' => @type} ).body.force_encoding("UTF-8")
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
    URI('http://www.fipe.org.br/IndicesConsulta-ConsultarMarcas')
  end

  def referer
    'http://www.fipe.org.br/pt-br/indices/veiculos/'
  end
end
