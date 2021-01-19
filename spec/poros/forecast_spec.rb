require 'rails_helper'

describe 'Forecast' do
  it 'can create an object from JSON' do
    VCR.use_cassette('open_weather_for_washington_dc') do
      response = OpenWeatherService.get_forecast(38.8921, -77.0199)

      forecast = Forecast.new(response)

      expect(forecast.current_weather).to be_a(Current)

      expect(forecast.hourly_weather).to be_an(Array)
      expect(forecast.hourly_weather.length).to eq(8)
      forecast.hourly_weather.each do |hour|
        expect(hour).to be_a(Hourly)
      end

      expect(forecast.daily_weather).to be_an(Array)
      expect(forecast.daily_weather.length).to eq(5)
      forecast.daily_weather.each do |day|
        expect(day).to be_a(Daily)
      end
    end
  end
end
