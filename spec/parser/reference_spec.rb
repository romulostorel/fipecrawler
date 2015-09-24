require 'spec_helper'
require 'parser/reference'

RSpec.describe Parser::Reference do
  subject { described_class }

  let :references do
    VCR.use_cassette('references', :match_requests_on => [:method, :uri]) do
      subject.references
    end
  end

  it 'the first reference should have Jan, 2001 with code 62' do
    expect(references.last).to eq({ code: 62, label: 'janeiro/2001' })
  end

  it 'should be all years sice 2001' do
    range_years = (2001..2015).to_a

    ref = references.map { |f| f[:label].split('/').last.to_i }.uniq.sort
    expect(ref).to eq range_years
  end
end
