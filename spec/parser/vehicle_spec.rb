require "spec_helper"
require "parser/vehicle"
require 'pry'

RSpec.describe Parser::Vehicle do
  subject { described_class.new(vehicle_hash) }

  let(:vehicle_hash) do
    {
      "Modelos"=>
        [{"Label"=>"Integra GS 1.8", "Value"=>1}, {"Label"=>"Legend 3.2/3.5", "Value"=>2}, {"Label"=>"NSX 3.0", "Value"=>3}],
      "Anos"=>
       [{"Label"=>"1998 Gasolina", "Value"=>"1998-1"},
        {"Label"=>"1997 Gasolina", "Value"=>"1997-1"},
        {"Label"=>"1996 Gasolina", "Value"=>"1996-1"},
        {"Label"=>"1995 Gasolina", "Value"=>"1995-1"},
        {"Label"=>"1994 Gasolina", "Value"=>"1994-1"},
        {"Label"=>"1993 Gasolina", "Value"=>"1993-1"},
        {"Label"=>"1992 Gasolina", "Value"=>"1992-1"},
        {"Label"=>"1991 Gasolina", "Value"=>"1991-1"}],
      :brand_id=>1,
      :type=>1
    }
  end

  it 'get only cars names from json' do
    expect(subject.parse).to eq [
      {:id=>1, :name=>"Integra GS 1.8", :brand_id=>1, :type=>1},
      {:id=>2, :name=>"Legend 3.2/3.5", :brand_id=>1, :type=>1},
      {:id=>3, :name=>"NSX 3.0", :brand_id=>1, :type=>1},
    ]
  end
end
