require "spec_helper"
require "importer/vehicle"
require "importer/brand"
require "parser/vehicle"

RSpec.describe Importer::Vehicle do
  subject { described_class }

  before do
    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      Importer::Brand.import
    end

    allow(Models::Brand).to receive(:all).and_return(Models::Brand.all(limit: 2))
  end

  it 'check first vehicle' do
    VCR.use_cassette('vehicles', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    expect(Models::Vehicle.first.name).to eq 'Integra GS 1.8'
    expect(Models::Vehicle.first.id).to eq 1
    expect(Models::Vehicle.first.brand.name).to eq 'Acura'
  end

  it 'check last vehicle' do
    VCR.use_cassette('vehicles', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    expect(Models::Vehicle.last.name).to eq 'MARRUÁ AM 50 2.8 140CV TDI Diesel'
    expect(Models::Vehicle.last.id).to eq 4569
    expect(Models::Vehicle.last.brand.name).to eq 'Agrale'
  end
end
