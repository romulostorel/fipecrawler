require 'spec_helper'
require "enumerations"

RSpec.describe Enumerations::VehicleType do
  it 'cars must be represented by 1' do
    expect(Enumerations::VehicleType::CAR).to eq 1
  end

  it 'motocicles must be represented by 2' do
    expect(Enumerations::VehicleType::MOTO).to eq 2
  end

  it 'trucks must be represented by 3' do
    expect(Enumerations::VehicleType::TRUCK).to eq 3
  end
end
