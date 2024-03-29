require 'rubygems'
require 'bundler'
require 'mongoid'

Bundler.require

Mongoid.logger = Logger.new($stdout)
Mongoid.add_language("pt-BR")
Mongoid.include_root_in_json

#MongoDB Config -- Change for production
#configure do
#  Mongoid.configure do |config|
#    name = "laptimer_development"
#    host = "localhost"
#    config.master = Mongo::Connection.new.db(name)
#  end
#end
Mongoid.load!("mongoid.yml")

require './src/web/laptimer-receiver'
run Receiver