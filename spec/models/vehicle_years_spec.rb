require 'spec_helper'
require 'pry'

describe Models::VehicleYear do
  subject do
    Models::VehicleYear.new(id: '1', value: 'Year Value', label: 'Vehicle label', vehicle_id: '1')
  end

  it { is_expected.to be_valid }

  it 'should be able to save' do
    expect { subject.save }.to change { Models::VehicleYear.count }.by(1)
  end

  it 'should be able to get record' do
    subject.save

    expect(Models::VehicleYear[1]).to eq subject
  end
end
