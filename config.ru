require 'rubygems'
require 'bundler'

Bundler.require

#MongoDB Config
Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("laptimer")
end

Mongoid.logger = Logger.new($stdout)
Mongoid.add_language("pt-BR")
Mongoid.include_root_in_json

require './src/web/laptimer-receiver'
run Receiver