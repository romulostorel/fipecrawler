require 'spec_helper'
require 'models'
require 'parser/vehicle_price'

RSpec.describe Parser::VehiclePrice do
  let!(:brand) { Models::Brand.create(name: "Agrale", id: 10) }
  let!(:vehicle) { Models::Vehicle.create(name: "MARRUÁ AM 100 2.8  CS TDI Diesel", brand_id: brand.id) }
  let!(:reference) { Models::Reference.create(label: 'março de 2015', code: 180) }

  let(:vehicle_price_hash) do
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

  it 'include search vehicle_type' do
    expect(described_class.parse(vehicle_price_hash)).to include :vehicle_type => 1
  end

  it 'include search reference_id' do
    expect(described_class.parse(vehicle_price_hash)).to include :reference_id => 180
  end

   it 'reference id return 1000 when is unknown' do
    Models::Reference.first.update(label: "Unknown")

    expect(described_class.parse(vehicle_price_hash)).to include :reference_id => 1000
  end

  it 'include vehicle fipe code' do
    expect(described_class.parse(vehicle_price_hash)).to include :fipe => '060003-2'
  end

  it 'include vehicle fuel type' do
    expect(described_class.parse(vehicle_price_hash)).to include :fuel => 'Diesel'
  end

  it 'include vehicle model year' do
    expect(described_class.parse(vehicle_price_hash)).to include :model_year => 2012
  end

  it 'include vehicle model_id' do
    expect(described_class.parse(vehicle_price_hash)).to include :model_id => vehicle.id
  end

  it 'vehicle id return 1000 when vehicle is unknown' do
    Models::Vehicle.first.update(name: "Unknown")

    expect(described_class.parse(vehicle_price_hash)).to include :model_id => 1000
  end

  it 'parse and include vehicle price' do
    expect(described_class.parse(vehicle_price_hash)).to include :price => 106.860
  end

  it 'get and include brand_id in hash' do
    expect(described_class.parse(vehicle_price_hash)).to include :brand_id => 10
  end

  it 'brand_id return 1000 when brand is unknown' do
    Models::Brand.first.update(name: "Unknown")

    expect(described_class.parse(vehicle_price_hash)).to include :brand_id => 1000
  end

  it 'parse all hash' do
    expect(described_class.parse(vehicle_price_hash)).to eq :price => 106.86,
      :brand_id => 10,
      :model_id => 1,
      :model_year => 2012,
      :fuel => "Diesel",
      :fipe => "060003-2",
      :reference_id => 180,
      :vehicle_type => 1
  end
end
