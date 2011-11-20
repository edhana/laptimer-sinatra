Dir[File.expand_path("../../src/**/*.rb", __FILE__)].each { |file| require file }

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'mongoid'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

#MongoDB Config
configure do
  Mongoid.configure do |config|
    name = "laptimer_test"
    host = "localhost"
    config.master = Mongo::Connection.new.db(name)
  end
end