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

  post '/receive_positions/?' do
    content_type :json
    errors = []
  
    if params.nil?
      errors << "Sem parametros recebidos no servidor."
    end

    received_json = JSON.parse(params[:positions])
    vehicle_id = received_json['vehicle_id'].to_i
    event_id = received_json['event_id'].to_i
    positions = received_json['vehicle_positions']

    puts "=====> Le Positions ===> #{positions.inspect}"

    begin
      Position.save_from_json(event_id, vehicle_id, positions)
    rescue Exception, NameError => error_string
      $stderr.print "[ERROR] Save Failed - Object Position: " + error_string
      errors << error_string
    end

    # TODO --> Retornar o json
    # JSON('OKOK')
    if errors.count > 0
      json = { :error_number => 0, :errors => nil, :message => 'Positions Saved' }.to_json
    else
      json = { :error_number => errors.count, :message => errors.collect{|e| "#{e} | "} }.to_json
    end

    json 
  end

  post '/new_position' do
    # position = a#eval(params[:vehicle_position])
    position = params[:vehicle_position]
    vehicle_id = params[:vehicle_id].to_i
    event_id = params[:event_id].to_i

    begin
      Position.save_position_from_json(event_id, vehicle_id, position)
    rescue Exception, NameError => error_string
      # $stderr.print "[ERROR] Save Failed - Object Position: " + error_string
      puts "[ERROR] Save Failed - Object Position: " + error_string
    end

    # TODO --> Retornar o json
    # JSON('OKOK')
    'ALO'
  end  

  get '/test_server' do
    html = "<h1>Laptimer Device Server v0.1 -  #{params[:device]} </h1>".strip
    html
  end
end