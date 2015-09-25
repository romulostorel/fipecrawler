require 'spec_helper'

describe Models::Vehicle do
  subject do
    Models::Vehicle.new(id: '1', name: 'Vehicle name', brand_id: '1')
  end

  it { is_expected.to be_valid }

  it 'should be able to save' do
    expect { subject.save }.to change { Models::Vehicle.count }.by(1)
  end

  it 'should be able to get record' do
    subject.save

    expect(Models::Vehicle[1]).to eq subject
  end

  context 'scopes' do
    it '#by_name' do
      uni = Models::Vehicle.create(name: 'Uno')

      expect(Models::Vehicle.by_name('Uno')).to eq uni
    end
  end
end
