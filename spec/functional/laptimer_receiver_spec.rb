require ::File.expand_path('../../spec_helper',  __FILE__)

describe Receiver do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "should respond to /" do
    get '/'
    puts "=====>>> #{last_response.body}"
    last_response.should be_ok
    assert_equal 'Hello World', last_response.body
  end
end