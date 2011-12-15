require ::File.expand_path('../../spec_helper',  __FILE__)

describe "Receiver" do  
  include Rack::Test::Methods

  before do
    Position.destroy_all
    @json_positions =  JSON 'positions' => {'vehicle_position' => [{'latitude' => 12, 'longitude'=> 13, 'speed' => 250, 'date' => Time.now.to_s}]}
  end

  def app
    @app ||= Receiver
  end

  it "should respond to /" do
    get '/'    
    last_response.status.should == 200
    last_response.body.include?('No Positions found!').should be_true
  end

  it "should respond to /receive_positions" do
    post 'receive_positions', :positions => @json_positions.gsub(':', '=>'), :vehicle_id => 12, :event_id => 10
    last_response.status.should == 200
  end

  it "should show the positions" do
    post 'receive_positions', :positions => @json_positions.gsub(':', '=>'), :vehicle_id => 12, :event_id => 10
    last_response.status.should == 200
    get '/'    
    last_response.status.should == 200
    last_response.body.include?('lat').should be_true
  end

  it "should test the device" do
    get 'test_server', :device => 'Android Froyo 2.2'
    last_response.status.should == 200
    last_response.body.include?('Android Froyo 2.2').should be_true
  end

  it "should receive just 1 position" do
    @vehicle_position =  JSON  'vehicle_position' => {'latitude' => 12, 'longitude'=> 13, 'speed' => 250, 'date' => Time.now.to_s}
    expect { post 'new_position', :vehicle_position => @vehicle_position, :vehicle_id => 12, :event_id => 10 }.to change(Position, :count).by(1)
  end
end