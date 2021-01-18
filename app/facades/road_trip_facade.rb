class RoadTripFacade
  class << self
    def create_road_trip(params_body) 
      coords = CoordinatesFacade.create_coordinates(params_body[:destination])
      time = TimeFacade.query_direction_time_data(params_body[:origin], params_body[:destination])
      weather = OpenWeatherService.get_forecast(coords[:lat], coords[:lng])
      arrival_hour = (Time.at(weather[:current][:dt]) + time.time_in_seconds.seconds).strftime("%H")

      forecast = weather[:hourly].find do |hour|
        Time.at(hour[:dt]).strftime("%H") == arrival_hour
      end
      RoadTrip.new(params_body, time.travel_time, forecast)
    end
  end
end
