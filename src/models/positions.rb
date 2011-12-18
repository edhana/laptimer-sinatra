require 'mongoid'
require 'json'

class Position
  include Mongoid::Document
  include Mongoid::Timestamps

  field :vehicle_id, type: Integer
  field :event_id, type: Integer
  field :latitude, type: String
  field :longitude, type: String
  field :altitude, type: Integer
  field :acquired_date, type: DateTime
  field :speed, type: Integer

  validates_presence_of :vehicle_id
  validates_presence_of :event_id
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :speed
  validates_presence_of :acquired_date

  def self.save_from_json(event_id, vehicle_id, positions_json)
    pos_json = positions_json.to_s.gsub('=>', ':')
    positions = JSON(pos_json)["positions"]

    positions['vehicle_position'].each do |pos|
      position = Position.new
      position.vehicle_id = vehicle_id
      position.event_id = event_id
      position.latitude = pos['latitude']
      position.longitude = pos['longitude']
      position.speed = pos['speed'].to_i
      position.acquired_date = Time.new(pos['date'])
      position.save
    end
  end

  def self.save_position_from_json(event_id, vehicle_id, position_json)
    pos_json = position_json.to_s.gsub('=>', ':')
    pos = JSON(pos_json)
    
    position = Position.new
    position.vehicle_id = vehicle_id
    position.event_id = event_id
    position.latitude = pos['latitude']
    position.longitude = pos['longitude']
    position.speed = pos['speed'].to_i
    position.acquired_date = Time.new(pos['acquired_date'])
    position.save
  end
end