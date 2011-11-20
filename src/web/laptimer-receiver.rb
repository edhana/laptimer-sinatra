require 'sinatra/base'

Dir[File.expand_path("../../models/*.rb", __FILE__)].each { |file| require file }

class Receiver < Sinatra::Base

  get '/' do
    "Hello World #{params[:name]}".strip
  end

  post '/new_position' do
    # retrieve a json object
    positions = params[:positions]
    vehicle_id = params[:vehicle_id].to_i
    event_id = params[:event_id].to_i

    begin
      position = Position.new
      position.vehicle_id = vehicle_id
      position.event_id = event_id
      # position.latitude = positions[:latitude]

      position.save

      puts "===> SAVED POSITION: #{position.inspect}"
    rescue Exception, NameError => boom
      puts "==============> Error: #{boom}" 
      $stderr.print "Falhou salvar: " + $!
    end

    puts "====> teste"
  end
end