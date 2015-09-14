require 'spec_helper'

describe Models::Brand do
  subject do
    Models::Brand.new(id: '1', name: 'Brand name')
  end

  it { is_expected.to be_valid }

  it 'should be able to save' do
    expect { subject.save }.to change { Models::Brand.count }.by(1)
  end

  it 'should be able to get record' do
    subject.save

    expect(Models::Brand[1]).to eq subject
  end
end
