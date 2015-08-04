require "spec_helper"
require "importer/brand"

RSpec.describe Importer::Brand do
  subject { described_class }

  it 'import 87 brands' do
    expect(Models::Brand.count).to eq 0

    subject.import

    expect(Models::Brand.count).to eq 87
  end

  it 'check first brand' do
    subject.import

    expect(Models::Brand.first.name).to eq 'Acura'
  end

  it 'check last brand' do
    expect(Models::Brand.last.name).to eq 'Walk'
  end
end
