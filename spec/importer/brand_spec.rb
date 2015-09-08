require "spec_helper"
require "importer/brand"

RSpec.describe Importer::Brand do
  subject { described_class }

  it 'import 87 brands' do
    expect(Models::Brand.count).to eq 0

    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    expect(Models::Brand.count).to eq 87
  end

  it 'check first brand' do
    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    expect(Models::Brand.first.name).to eq 'Acura'
  end

  it 'check last brand' do
    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    expect(Models::Brand.last.name).to eq 'GEELY'
  end
end
