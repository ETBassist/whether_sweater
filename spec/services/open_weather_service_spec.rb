require 'rails_helper'

describe 'OpenWeatherService' do
  it 'returns a hashed response with weather data' do
    lat = 38.892062
    lng = -77.019912
    data = OpenWeatherService.get_forecast(lat, lng)

    expect(data).to have_key(:current)
    expect(data[:current]).to have_key(:dt)
    expect(data[:current][:dt]).to be_an(Integer)
    expect(data[:current]).to have_key(:sunrise)
    expect(data[:current][:sunrise]).to be_an(Integer)
    expect(data[:current]).to have_key(:sunset)
    expect(data[:current][:sunset]).to be_an(Integer)
    expect(data[:current]).to have_key(:temp)
    expect(data[:current][:temp]).to be_an(Integer)
    expect(data[:current]).to have_key(:feels_like)
    expect(data[:current][:feels_like]).to be_a(Float)
    expect(data[:current]).to have_key(:humidity)
    expect(data[:current][:humidity]).to be_an(Integer)
    expect(data[:current]).to have_key(:uvi)
    expect(data[:current][:uvi]).to be_a(Float)
    expect(data[:current]).to have_key(:visibility)
    expect(data[:current][:visibility]).to be_an(Integer)
    expect(data[:current]).to have_key(:weather)
    expect(data[:current][:weather]).to be_an(Array)
    expect(data[:current][:weather][0]).to have_key(:description)

    expect(data).to have_key(:hourly)
    expect(data[:hourly]).to be_an(Array)
    data[:hourly].each do |hour|
      expect(hour).to be_a(Hash)
      expect(hour).to have_key(:dt)
      expect(hour[:dt]).to be_an(Integer)
      expect(hour).to have_key(:temp)
      expect(hour[:temp]).to be_an(Integer)
      expect(hour).to have_key(:wind_speed)
      expect(hour[:wind_speed]).to be_a(Float)
      expect(hour).to have_key(:wind_deg)
      expect(hour[:wind_deg]).to be_an(Integer)
      expect(hour).to have_key(:weather)
      expect(hour[:weather]).to be_a(Array)
      expect(hour[:weather][0]).to have_key(:description)
      expect(hour[:weather][0][:description]).to be_a(String)
      expect(hour[:weather][0]).to have_key(:icon)
      expect(hour[:weather][0][:icon]).to be_a(String)
    end

    expect(data).to have_key(:daily)
    expect(data[:daily]).to be_an(Array)
    data[:daily].each do |day|
      expect(day).to be_a(Hash)
      expect(day).to have_key(:dt)
      expect(day[:dt]).to be_an(Integer)
      expect(day).to have_key(:sunrise)
      expect(day[:sunrise]).to be_an(Integer)
      expect(day).to have_key(:sunset)
      expect(day[:sunset]).to be_a(Integer)
      expect(day).to have_key(:temp)
      expect(day[:temp]).to be_a(Hash)
      expect(day[:temp]).to have_key(:max)
      expect(day[:temp][:max]).to be_a(Float)
      expect(day[:temp]).to have_key(:min)
      expect(day[:temp][:min]).to be_a(Float)
      expect(day).to have_key(:weather)
      expect(day[:weather]).to be_a(Array)
      expect(day[:weather][0]).to have_key(:description)
      expect(day[:weather][0][:description]).to be_a(String)
      expect(day[:weather][0]).to have_key(:icon)
      expect(day[:weather][0][:icon]).to be_a(String)
    end
  end
end
