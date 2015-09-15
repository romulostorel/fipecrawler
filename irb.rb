require 'dotenv'
Dotenv.load

require 'sequel'
Sequel.extension :migration
$db = Sequel.connect ENV['DATABASE_URL']
Sequel::Migrator.run($db, './lib/migrations')

require './lib/fipe_crawler'
