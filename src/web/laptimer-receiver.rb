require 'sinatra/base'

class Receiver < Sinatra::Base

	get '/' do
		"Hello World #{params[:name]}".strip
	end
end