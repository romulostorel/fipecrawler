module FipeCrawler
  class DbConnector
    DataMapper.setup(:default, 'postgres://user:password@hostname/database')
    DataMapper.finalize
    DataMapper.auto_migrate!
    DataMapper.auto_upgrade!
  end
end
