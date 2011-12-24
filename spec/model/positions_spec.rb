require ::File.expand_path('../../spec_helper',  __FILE__)

describe "Position" do
  it "should not save an invalid position" do 
    position = Position.new
    position.save.should be_false
  end

  it "should save a valid position" do
    position = Position.new
    position.vehicle_id = 1
    position.event_id = 1
    position.latitude = "12"
    position.longitude = "14"
    position.altitude = 1440
    position.acquired_date = Time.now
    position.speed = 314
    position.save.should be_true
  end

  it "should save a position that came from a json string" do
    json_string = '{"positions" : { "vehicle_position" : [{"latitude" : 12, "longitude" : 13, "speed" : 250, "date" : "2011-11-28 20:47:51 -0200" }]}}'
    Position.save_from_json(1, 1, json_string).should be_true
  end

  it "should save a single position that came from a json string" do
    json_string = '{"latitude" : 12, "longitude" : 13, "speed" : 250, "acquired_date" : "2011-11-28 20:47:51 -0200" }'
    expect { Position.save_position_from_json(1, 1, json_string) }.to change(Position, :count).by(1)
  end
end