require 'rails_helper'

describe 'OpenWeatherService' do
  it 'returns a hashed response with weather data' do
    VCR.use_cassette('open_weather_for_washington_dc') do
      data = OpenWeatherService.get_forecast(38.8921, -77.0199)

      expect(data).to have_key(:current)
      expect(data[:current]).to have_key(:dt)
      expect(data[:current]).to have_key(:sunrise)
      expect(data[:current]).to have_key(:sunset)
      expect(data[:current]).to have_key(:temp)
      expect(data[:current]).to have_key(:feels_like)
      expect(data[:current]).to have_key(:humidity)
      expect(data[:current]).to have_key(:uvi)
      expect(data[:current]).to have_key(:visibility)
      expect(data[:current]).to have_key(:weather)
      expect(data[:current][:weather]).to be_an(Array)
      expect(data[:current][:weather][0]).to have_key(:description)

      expect(data).to have_key(:hourly)
      expect(data[:hourly]).to be_an(Array)
      data[:hourly].each do |hour|
        expect(hour).to be_a(Hash)
        expect(hour).to have_key(:dt)
        expect(hour).to have_key(:temp)
        expect(hour).to have_key(:wind_speed)
        expect(hour).to have_key(:wind_deg)
        expect(hour).to have_key(:weather)
        expect(hour[:weather]).to be_a(Array)
        expect(hour[:weather][0]).to have_key(:description)
        expect(hour[:weather][0]).to have_key(:icon)
      end

      expect(data).to have_key(:daily)
      expect(data[:daily]).to be_an(Array)
      data[:daily].each do |day|
        expect(day).to be_a(Hash)
        expect(day).to have_key(:dt)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day).to have_key(:temp)
        expect(day[:temp]).to have_key(:max)
        expect(day[:temp]).to have_key(:min)
        expect(day).to have_key(:weather)
        expect(day[:weather][0]).to have_key(:description)
        expect(day[:weather][0]).to have_key(:icon)
      end
    end
  end
end
