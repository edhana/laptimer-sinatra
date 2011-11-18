class Position
  include Mongoid::Document
  field :vehicle_id, type: Integer
  field :event_id, type: Integer
  field :latitude, type: String
  field :longitude, type: String
  field :speed, type: Integer
end