class MunchieSerializer
  include FastJsonapi::ObjectSerializer

  set_type :munchie

  attributes :destination_city, :travel_time, :forecast, :restaurant
end
