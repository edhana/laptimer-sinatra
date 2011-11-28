require 'mongoid'

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
end