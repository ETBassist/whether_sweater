require 'rails_helper' 

describe 'Forecast Facade' do
  it 'creates a forecast object using OpenWeatherService' do
    VCR.use_cassette('open_weather_for_washington_dc') do
      forecast = ForecastFacade.create_forecast_for_coordinates(38.8921, -77.0199)

      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather).to be_a(Hash)
      expect(forecast.daily_weather).to be_an(Array)
      expect(forecast.hourly_weather).to be_an(Array)
    end
  end
end
