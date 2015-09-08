require "spec_helper"
require "importer/brand"
require "catcher/vehicle"

RSpec.describe Catcher::Vehicle do
  let(:brand_json) do
    [{"Modelos"=>
       [{"Label"=>"Integra GS 1.8", "Value"=>1},
        {"Label"=>"Legend 3.2/3.5", "Value"=>2},
        {"Label"=>"NSX 3.0", "Value"=>3}],
      "Anos"=>
       [{"Label"=>"1998 Gasolina", "Value"=>"1998-1"},
        {"Label"=>"1997 Gasolina", "Value"=>"1997-1"},
        {"Label"=>"1996 Gasolina", "Value"=>"1996-1"},
        {"Label"=>"1995 Gasolina", "Value"=>"1995-1"},
        {"Label"=>"1994 Gasolina", "Value"=>"1994-1"},
        {"Label"=>"1993 Gasolina", "Value"=>"1993-1"},
        {"Label"=>"1992 Gasolina", "Value"=>"1992-1"},
        {"Label"=>"1991 Gasolina", "Value"=>"1991-1"}],
      :brand_id=>1}]
  end

  subject { described_class.new }

  before do
    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      Importer::Brand.import
    end
  end

  it 'get all brands json' do
    VCR.use_cassette('vehicles') do
      subject.brands = Models::Brand.all(limit: 1)

      expect(subject.catch).to eq brand_json
    end
  end
end
