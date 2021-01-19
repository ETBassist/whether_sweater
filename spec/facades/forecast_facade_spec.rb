require 'rails_helper' 

describe 'Forecast Facade' do
  it 'creates a forecast object using OpenWeatherService' do
    VCR.use_cassette('open_weather_for_washington_dc') do
      forecast = ForecastFacade.create_forecast_for_coordinates(38.8921, -77.0199)

      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather).to be_a(Current)
      forecast.daily_weather.each do |daily_weather|
        expect(daily_weather).to be_a(Daily)
      end

      forecast.hourly_weather.each do |hourly_weather|
        expect(hourly_weather).to be_an(Hourly)
      end
    end
  end
end
