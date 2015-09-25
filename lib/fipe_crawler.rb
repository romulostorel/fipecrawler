require 'json'
require 'sequel'

require './lib/catcher'
require './lib/catcher/brand'
require './lib/catcher/vehicle'
require './lib/catcher/vehicle_year'
require './lib/parser'
require './lib/parser/reference'
require './lib/parser/vehicle'
require './lib/parser/vehicle_year'
require './lib/importer'
require './lib/importer/brand'
require './lib/importer/vehicle'
require './lib/importer/vehicle_year'
require './lib/models'

class FipeCrawler
  USER_AGENT = 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0'
end
