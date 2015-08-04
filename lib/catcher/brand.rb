require 'net/http'

class Catcher::Brand
  def self.catch
    new.catch
  end

  def catch
    get_json
  end

  protected

  def get_json
    post(params: {'codigoTabelaReferencia' => 182, 'codigoTipoVeiculo' => 1 } ).body.force_encoding("UTF-8")
  end

  def post(params:)
    Net::HTTP.post_form(uri, params)
  end

  def uri
    URI('http://www.fipe.org.br/IndicesConsulta-ConsultarMarcas')
  end
end
