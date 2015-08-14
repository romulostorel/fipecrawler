require "spec_helper"
require "parser/vehicle"
require 'pry'

RSpec.describe Parser::Vehicle do
  subject { described_class }

  let(:vehicle_hash) do
    [{
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
      :brand_id=>1},
     {"Modelos"=>
       [{"Label"=>"MARRUÁ 2.8 12V 132cv TDI Diesel", "Value"=>4},
        {"Label"=>"MARRUÁ AM 100 2.8  CS TDI Diesel", "Value"=>4564},
        {"Label"=>"MARRUÁ AM 100 2.8 CD TDI Diesel", "Value"=>4563},
        {"Label"=>"MARRUÁ AM 150 2.8  CS TDI Diesel", "Value"=>4566},
        {"Label"=>"MARRUÁ AM 150 2.8 CD TDI Diesel", "Value"=>4565},
        {"Label"=>"MARRUÁ AM 200 2.8  CD TDI Diesel", "Value"=>4567},
        {"Label"=>"MARRUÁ AM 200 2.8 CS TDI Diesel", "Value"=>4568},
        {"Label"=>"MARRUÁ AM 50 2.8 140CV TDI Diesel", "Value"=>4569}],
      "Anos"=>
       [{"Label"=>"32000 Diesel", "Value"=>"32000-3"},
        {"Label"=>"2015 Diesel", "Value"=>"2015-3"},
        {"Label"=>"2014 Diesel", "Value"=>"2014-3"},
        {"Label"=>"2013 Diesel", "Value"=>"2013-3"},
        {"Label"=>"2012 Diesel", "Value"=>"2012-3"},
        {"Label"=>"2011 Diesel", "Value"=>"2011-3"},
        {"Label"=>"2010 Diesel", "Value"=>"2010-3"},
        {"Label"=>"2009 Diesel", "Value"=>"2009-3"},
        {"Label"=>"2008 Diesel", "Value"=>"2008-3"},
        {"Label"=>"2007 Diesel", "Value"=>"2007-3"},
        {"Label"=>"2006 Diesel", "Value"=>"2006-3"},
        {"Label"=>"2005 Diesel", "Value"=>"2005-3"},
        {"Label"=>"2004 Diesel", "Value"=>"2004-3"}],
      :brand_id=>2}]
   end

  it 'get only cars names from json' do
    expect(described_class.parse(vehicle_hash)).to eq [
      {:id=>1, :name=>"Integra GS 1.8", :brand_id=>1},
      {:id=>2, :name=>"Legend 3.2/3.5", :brand_id=>1},
      {:id=>3, :name=>"NSX 3.0", :brand_id=>1},
      {:id=>4, :name=>"MARRUÁ 2.8 12V 132cv TDI Diesel", :brand_id=>2},
      {:id=>4564, :name=>"MARRUÁ AM 100 2.8  CS TDI Diesel", :brand_id=>2},
      {:id=>4563, :name=>"MARRUÁ AM 100 2.8 CD TDI Diesel", :brand_id=>2},
      {:id=>4566, :name=>"MARRUÁ AM 150 2.8  CS TDI Diesel", :brand_id=>2},
      {:id=>4565, :name=>"MARRUÁ AM 150 2.8 CD TDI Diesel", :brand_id=>2},
      {:id=>4567, :name=>"MARRUÁ AM 200 2.8  CD TDI Diesel", :brand_id=>2},
      {:id=>4568, :name=>"MARRUÁ AM 200 2.8 CS TDI Diesel", :brand_id=>2},
      {:id=>4569, :name=>"MARRUÁ AM 50 2.8 140CV TDI Diesel", :brand_id=>2}
    ]
  end
end
