class ForecastFacade
  class << self
    def create_forecast_for_coordinates(lat, lng)
      Forecast.new(OpenWeatherService.get_forecast(lat, lng))
    end
  end
end
