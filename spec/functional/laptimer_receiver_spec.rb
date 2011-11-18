require ::File.expand_path('../../spec_helper',  __FILE__)

describe "Receiver" do  
  include Rack::Test::Methods

  def app
    @app ||= Receiver
  end

  it "should respond to /" do
    get '/'    
    last_response.status.should be_eql(200)
    last_response.body.include?('Hello World').should be_true
  end
end