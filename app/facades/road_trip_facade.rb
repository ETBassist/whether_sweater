class RoadTripFacade
  class << self
    def create_road_trip(params_body) 
      coords = CoordinatesFacade.create_coordinates(params_body[:destination])
      time = TimeFacade.query_direction_time_data(params_body[:origin], params_body[:destination])
      weather = OpenWeatherService.get_forecast(coords[:lat], coords[:lng])

      RoadTrip.new(params_body, time, weather)
    end
  end
end
