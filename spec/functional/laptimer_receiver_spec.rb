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
    @json_positions =  JSON 'positions' => {'vehicle_position' => [{'latitude' => 12, 'longitude'=> 13, 'speed' => 250, 'date' => Time.now.to_s}]}
    post 'new_position', :positions => @json_positions.gsub(':', '=>'), :vehicle_id => 12, :event_id => 10
    last_response.status.should == 200
  end
end