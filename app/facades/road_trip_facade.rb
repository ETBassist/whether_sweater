class RoadTripFacade
  class << self
    def create_road_trip(params_body) 
      time_space = TimeSpaceFacade.query_direction_time_data(params_body[:origin], params_body[:destination])
      weather = OpenWeatherService.get_forecast(time_space.lat, time_space.lng)

      RoadTrip.new(params_body, time_space, weather)
    end
  end
end
