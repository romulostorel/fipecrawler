require 'net/http'

module Catcher
  class Brand
    def self.catch
      uri = URI('http://www.fipe.org.br/IndicesConsulta-ConsultarMarcas')
      Net::HTTP.post_form(uri, 'codigoTabelaReferencia' => 182, 'codigoTipoVeiculo' => 1).body.force_encoding("UTF-8")
    end
  end
end
