require 'spec_helper'
require 'parser/vehicle_year'

RSpec.describe Parser::VehicleYear do
  let(:vehicle_year_hash) do
    [
      {'Label' => '1992 Gasolina', 'Value' => '1992-1'},
      {'Label' => '1991 Gasolina','Value' => '1991-1'},
    ]
  end

  subject do
    VCR.use_cassette('vehicle_years') do
      described_class.parse(vehicle_id: 1, vehicle_year_hash: vehicle_year_hash)
    end
  end

  it 'parse correctly the years' do
    expect(subject).to eq [
      { :label => '1992 Gasolina', :value => 1992, :vehicle_id => 1},
      { :label => '1991 Gasolina', :value => 1991, :vehicle_id => 1}
    ]
  end
end
