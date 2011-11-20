require 'mongoid'

class Position
  include Mongoid::Document
  include Mongoid::Timestamps

  field :vehicle_id, type: Integer
  field :event_id, type: Integer
  field :latitude, type: String
  field :longitude, type: String
  field :speed, type: Integer

  # validates_presence_of :vehicle_id
end