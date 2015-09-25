require 'spec_helper'
require 'enumerations'

RSpec.describe Enumerations::VehicleFuelType do
  it 'gasolina must be represented by 1' do
    expect(Enumerations::VehicleFuelType::GASOLINE).to eq 1
  end

  it 'gasolina must be represented by 2' do
    expect(Enumerations::VehicleFuelType::ALCOHOL).to eq 2
  end

  it 'gasolina must be represented by 3' do
    expect(Enumerations::VehicleFuelType::DIESEL).to eq 3
  end
end
