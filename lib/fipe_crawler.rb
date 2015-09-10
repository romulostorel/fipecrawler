require 'data_mapper'
require './lib/db_connector'
require './lib/models'
require './lib/catcher'
require './lib/importer'
require './lib/parser'

class FipeCrawler
  USER_AGENT = 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0'
end
