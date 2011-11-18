require 'sinatra/base'

class Receiver < Sinatra::Base
	get '/' do
		"Hello World #{params[:name]}".strip
	end

	post '/new_position' do
		# retrieve a json object
		position = params[:position]
	end
end