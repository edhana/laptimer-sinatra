Dir[File.expand_path("../../src/**/*.rb", __FILE__)].each { |file| require file }

require 'rubygems'
require 'sinatra'
require 'rack/test'
# require 'spec'
# require 'spec/autorun'
# require 'spec/interop/test'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false