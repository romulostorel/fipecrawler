require "spec_helper"
require "catcher/vehicle_price"

RSpec.describe Catcher::VehiclePrice do
  let(:reference) { 176 }
  let(:brand_id) { 2 }
  let(:model_id) { 4564 }
  let(:type) { 1 }
  let(:model_year) { 2012 }
  let(:fuel_type_id) { 3 }

  let(:price_json) do
    { "Valor"=>"R$ 106.860,00",
      "Marca"=>"Agrale",
      "Modelo"=>"MARRUÁ AM 100 2.8  CS TDI Diesel",
      "AnoModelo"=>2012,
      "Combustivel"=>"Diesel",
      "CodigoFipe"=>"060003-2  ",
      "MesReferencia"=>"março de 2015 ",
      "Autenticacao"=>"gcmcnnkn3gcl1",
      "TipoVeiculo"=>1,
      "SiglaCombustivel"=>"D",
      "DataConsulta"=>"quinta-feira, 24 de setembro de 2015 11:33:14"
    }
  end

  subject { described_class }

  it 'get all brands json' do
    VCR.use_cassette('vehicle_prices') do
      expect(subject.catch(reference: reference, brand_id: brand_id, model_id: model_id, type: type,
        model_year: model_year, fuel_type_id: fuel_type_id)).to eq price_json
    end
  end
end
