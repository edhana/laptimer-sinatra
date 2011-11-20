require 'sinatra/base'
require 'json'

Dir[File.expand_path("../../models/*.rb", __FILE__)].each { |file| require file }

class Receiver < Sinatra::Base

  get '/' do
    "Hello World #{params[:name]}".strip
  end

  post '/new_position' do
    positions = eval(params[:positions])
    vehicle_id = params[:vehicle_id].to_i
    event_id = params[:event_id].to_i

    begin

      positions['vehicle_position'].each do |pos|
        position = Position.new
        position.vehicle_id = vehicle_id
        position.event_id = event_id
        position.latitude = pos['latitude']
        position.longitude = pos['longitude']
        position.speed = pos['speed'].to_i

        position.save
      end
    rescue Exception, NameError => error_string
      $stderr.print "Falhou salvar: " + error_string
    end

    # TODO: Remover -- resposta html
    'ALO'
  end
end