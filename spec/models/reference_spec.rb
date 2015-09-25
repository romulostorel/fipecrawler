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

  context 'scopes' do
    it '#by_label' do
      ref = Models::Reference.create(label: 'Abril 2015', code: 10)

      expect(Models::Reference.by_label('Abril 2015')).to eq ref
    end
  end
end
