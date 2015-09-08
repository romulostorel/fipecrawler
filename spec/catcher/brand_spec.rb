require "spec_helper"
require "catcher/brand"

RSpec.describe Catcher::Brand do
  let(:brand_json) do
    %Q{[{"Label":"Acura","Value":1},{"Label":"Agrale","Value":2},{"Label":"Alfa Romeo","Value":3},{"Label":"AM Gen","Value":4},{"Label":"Asia Motors","Value":5},{"Label":"ASTON MARTIN","Value":189},{"Label":"Audi","Value":6},{"Label":"BMW","Value":7},{"Label":"BRM","Value":8},{"Label":"Buggy","Value":9},{"Label":"Bugre","Value":123},{"Label":"Cadillac","Value":10},{"Label":"CBT Jipe","Value":11},{"Label":"CHANA","Value":136},{"Label":"CHANGAN","Value":182},{"Label":"CHERY","Value":161},{"Label":"Chrysler","Value":12},{"Label":"Citroën","Value":13},{"Label":"Cross Lander","Value":14},{"Label":"Daewoo","Value":15},{"Label":"Daihatsu","Value":16},{"Label":"Dodge","Value":17},{"Label":"EFFA","Value":147},{"Label":"Engesa","Value":18},{"Label":"Envemo","Value":19},{"Label":"Ferrari","Value":20},{"Label":"Fiat","Value":21},{"Label":"Fibravan","Value":149},{"Label":"Ford","Value":22},{"Label":"FOTON","Value":190},{"Label":"Fyber","Value":170},{"Label":"GEELY","Value":199},{"Label":"GM - Chevrolet","Value":23},{"Label":"GREAT WALL","Value":153},{"Label":"Gurgel","Value":24},{"Label":"HAFEI","Value":152},{"Label":"Honda","Value":25},{"Label":"Hyundai","Value":26},{"Label":"Isuzu","Value":27},{"Label":"JAC","Value":177},{"Label":"Jaguar","Value":28},{"Label":"Jeep","Value":29},{"Label":"JINBEI","Value":154},{"Label":"JPX","Value":30},{"Label":"Kia Motors","Value":31},{"Label":"Lada","Value":32},{"Label":"LAMBORGHINI","Value":171},{"Label":"Land Rover","Value":33},{"Label":"Lexus","Value":34},{"Label":"LIFAN","Value":168},{"Label":"LOBINI","Value":127},{"Label":"Lotus","Value":35},{"Label":"Mahindra","Value":140},{"Label":"Maserati","Value":36},{"Label":"Matra","Value":37},{"Label":"Mazda","Value":38},{"Label":"Mercedes-Benz","Value":39},{"Label":"Mercury","Value":40},{"Label":"MG","Value":167},{"Label":"MINI","Value":156},{"Label":"Mitsubishi","Value":41},{"Label":"Miura","Value":42},{"Label":"Nissan","Value":43},{"Label":"Peugeot","Value":44},{"Label":"Plymouth","Value":45},{"Label":"Pontiac","Value":46},{"Label":"Porsche","Value":47},{"Label":"RAM","Value":185},{"Label":"RELY","Value":186},{"Label":"Renault","Value":48},{"Label":"Rolls-Royce","Value":195},{"Label":"Rover","Value":49},{"Label":"Saab","Value":50},{"Label":"Saturn","Value":51},{"Label":"Seat","Value":52},{"Label":"SHINERAY","Value":183},{"Label":"smart","Value":157},{"Label":"SSANGYONG","Value":125},{"Label":"Subaru","Value":54},{"Label":"Suzuki","Value":55},{"Label":"TAC","Value":165},{"Label":"Toyota","Value":56},{"Label":"Troller","Value":57},{"Label":"Volvo","Value":58},{"Label":"VW - VolksWagen","Value":59},{"Label":"Wake","Value":163},{"Label":"Walk","Value":120}]}
  end

  subject { described_class }

  it 'get all brands json' do
    VCR.use_cassette('brands', :match_requests_on => [:method, :uri]) do
      expect(subject.catch).to eq brand_json
    end
  end
end
