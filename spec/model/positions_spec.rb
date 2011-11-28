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
end