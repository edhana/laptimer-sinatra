require ::File.expand_path('../../spec_helper',  __FILE__)

describe "Receiver" do  
  include Rack::Test::Methods

  def app
    @app ||= Receiver
  end

  it "should respond to /" do
    get '/'    
    last_response.status.should == 200
    last_response.body.include?('Hello World').should be_true
  end

  it "should respond to /new_position" do
    post '/new_position'
    last_response.status.should == 200
  end
end