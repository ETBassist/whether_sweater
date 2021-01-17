require 'rails_helper'

describe 'Forecast' do
  it 'can create an object from JSON' do
    VCR.use_cassette('open_weather_for_washington_dc') do
      response = OpenWeatherService.get_forecast(38.8921, -77.0199)

      forecast = Forecast.new(response)

      expect(forecast.current_weather).to be_a(Hash)
      expect(forecast.current_weather).to have_key(:datetime)
      expect(forecast.current_weather).to have_key(:sunrise)
      expect(forecast.current_weather).to have_key(:sunset)
      expect(forecast.current_weather).to have_key(:temperature)
      expect(forecast.current_weather).to have_key(:feels_like)
      expect(forecast.current_weather).to have_key(:humidity)
      expect(forecast.current_weather).to have_key(:uvi)
      expect(forecast.current_weather).to have_key(:visibility)
      expect(forecast.current_weather).to have_key(:conditions)
      expect(forecast.current_weather).to have_key(:icon)

      expect(forecast.hourly_weather).to be_an(Array)
      expect(forecast.hourly_weather.length).to eq(8)
      forecast.hourly_weather.each do |hour|
        expect(hour).to be_a(Hash)
        expect(hour).to have_key(:time)
        expect(hour).to have_key(:temperature)
        expect(hour).to have_key(:wind_speed)
        expect(hour).to have_key(:wind_direction)
        expect(hour).to have_key(:conditions)
        expect(hour).to have_key(:icon)
      end

      expect(forecast.daily_weather).to be_an(Array)
      expect(forecast.daily_weather.length).to eq(5)
      forecast.daily_weather.each do |day|
        expect(day).to be_a(Hash)
        expect(day).to have_key(:date)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day).to have_key(:max_temp)
        expect(day).to have_key(:min_temp)
        expect(day).to have_key(:conditions)
        expect(day).to have_key(:icon)
      end
    end
  end
end
