require 'spec_helper'
require 'importer/reference'

RSpec.describe Importer::Reference do
  subject { described_class }

  context 'last reference' do
    it 'should correct label' do
      VCR.use_cassette('references', :match_requests_on => [:method, :uri]) do
        subject.import
      end

      expect(Models::Reference.map(&:label)).to include 'janeiro/2001'
    end

    it 'should correct code' do
      VCR.use_cassette('references', :match_requests_on => [:method, :uri]) do
        subject.import
      end

      expect(Models::Reference.map(&:code)).to include 62
    end
  end
end
