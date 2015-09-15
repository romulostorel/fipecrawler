require "spec_helper"
require "importer/vehicle"
require "importer/brand"
require "parser/vehicle"

RSpec.describe Importer::Vehicle do
  subject { described_class.new }

  before do
    Models::Brand.create(id: 1, name: 'Acura')
  end

  it 'imports vehicles' do
    VCR.use_cassette('vehicles', :match_requests_on => [:method, :uri]) do
      expect { subject.import }.to change { Models::Vehicle.count }.by(3)
    end
  end

  it 'correct imports vehicles' do
    VCR.use_cassette('vehicles', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    expect(Models::Vehicle.all.map(&:name)).to include 'Integra GS 1.8'
  end

  it 'correct imports vehicles with brand' do
    VCR.use_cassette('vehicles', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    vehicle = Models::Vehicle.where(name: 'Integra GS 1.8').all[0]
    expect(vehicle.brand.name).to eq 'Acura'
  end
end
