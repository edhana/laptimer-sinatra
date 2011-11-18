require 'sinatra/base'

class Receiver < Sinatra::Base
	get '/' do
		"Hello World #{params[:name]}".strip
	end

	# post '/process_position' do
	# 	position = params[:position]
	# end
end