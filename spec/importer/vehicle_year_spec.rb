require 'spec_helper'
require 'catcher/vehicle_year'
require 'importer/vehicle_year'

RSpec.describe Importer::VehicleYear do
  subject { described_class }

  it 'imports years' do
    VCR.use_cassette('vehicle_years') do
      expect{subject.import(reference: 182, brand_id: 1, vehicle_id: 1, type: 1)}.to change { Models::VehicleYear.count }.by(2)
    end
  end

  it 'import years correctly' do
    VCR.use_cassette('vehicle_years') do
      subject.import(reference: 182, brand_id: 1, vehicle_id: 1, type: 1)
    end

    vehicle_years = Models::VehicleYear.where(vehicle_id: 1).map(&:label)
    expect(vehicle_years).to contain_exactly('1992 Gasolina', '1991 Gasolina')
  end
end
