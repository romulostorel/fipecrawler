require "spec_helper"
require "importer/brand"

RSpec.describe Importer::Brand do
  subject { described_class }

  it 'import 87 brands' do
    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      expect { subject.import }.to change { Models::Brand.count }.by(87)
    end
  end

  it 'import brand' do
    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    expect(Models::Brand.map(&:name)).to include 'Acura'
  end

  it 'check last brand' do
    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      subject.import
    end

    expect(Models::Brand.map(&:name)).to include 'GEELY'
  end
end
