require 'spec_helper'

RSpec.describe Models::Reference do
  subject { described_class.new(id: 1, label: 'month/year', code: 1) }

  it { is_expected.to be_valid }

  it 'should be able to save' do
    expect { subject.save }.to change { Models::Reference.count }.by(1)
  end

  it 'should be able to get record' do
    subject.save
    expect(Models::Reference[1]).to eq subject
  end
end
