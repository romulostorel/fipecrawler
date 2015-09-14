require 'sequel'
require 'dotenv'
Dotenv.load

namespace :db do
  # From: http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    Sequel.extension :migration

    db = Sequel.connect ENV['DATABASE_URL']
    migrations_dir = './lib/migrations'

    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, migrations_dir, target: args[:version].to_i)
    else
      puts 'Migrating to latest'
      Sequel::Migrator.run(db, migrations_dir)
    end
  end
end
