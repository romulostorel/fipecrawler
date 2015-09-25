require 'spec_helper'
require 'catcher/vehicle_year'

RSpec.describe Catcher::VehicleYear do
  subject { described_class }

  let(:years_json) do
    [{'Label' => '1992 Gasolina', 'Value' => '1992-1'},
    {'Label' => '1991 Gasolina', 'Value' => '1991-1'}]
  end

  it 'should get all years' do
    VCR.use_cassette('vehicle_years') do
      expect(subject.catch(reference: 183, brand_id: 1, vehicle_id: 1, type: 1)).to eq years_json
    end
  end
end
