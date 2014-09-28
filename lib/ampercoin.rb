require 'pry'
require 'openssl'
require 'base58'
require 'active_model'
require 'active_record'
require 'sqlite3'

db_file = File.join(Dir.home, ".ampercoin/db.sqlite3")
schema_file = File.join(File.dirname(__FILE__), "../db/schema.rb")

if File.exists?(db_file)
  ActiveRecord::Base.establish_connection(
    adapter: :sqlite3,
    database: db_file
  )
else
  ActiveRecord::Base.establish_connection(
    adapter: :sqlite3,
    database: db_file
  )

  ActiveRecord::Tasks::DatabaseTasks.load_schema(:ruby, schema_file)
end
module Ampercoin
  autoload :Account, 'ampercoin/account'
end
