require 'sinatra/base'
require 'json'

Dir[File.expand_path("../../models/*.rb", __FILE__)].each { |file| require file }

class Receiver < Sinatra::Base

  get '/' do
    html = "<h1>Positions: -  #{params[:name]} </h1>".strip

    positions = Position.all
    unless positions.empty?
      positions.each do |p|
        html += "Position: lat: #{p.latitude} long: #{p.longitude}"
      end
    else
      html += "<br/> No Positions found!"
    end

    html
  end

  post '/new_position' do
    positions = eval(params[:positions])
    vehicle_id = params[:vehicle_id].to_i
    event_id = params[:event_id].to_i

    begin
      Position.save_from_json(event_id, vehicle_id, positions)
    rescue Exception, NameError => error_string
      $stderr.print "[ERROR] Save Failed - Object Position: " + error_string
    end

    # TODO --> Retornar o json
    # JSON('OKOK')
    'ALO'
  end
end