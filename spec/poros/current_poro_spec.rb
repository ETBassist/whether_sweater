require 'rails_helper'

describe 'Current PORO' do
  it 'can be instantiated from a weather response' do
    data = {
      "dt": 1610996952,
      "sunrise": 1610972620,
      "sunset": 1611007987,
      "temp": 43.86,
      "feels_like": 31.44,
      "pressure": 1011,
      "humidity": 33,
      "dew_point": 18.36,
      "uvi": 1.03,
      "clouds": 75,
      "visibility": 10000,
      "wind_speed": 12.66,
      "wind_deg": 250,
      "wind_gust": 20.71,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ]
    }

    current_weather = Current.new(data)

    expect(current_weather.datetime).to eq('2021-01-18 11:09:12 -0800')
    expect(current_weather.sunrise).to eq('2021-01-18 04:23:40 -0800')
    expect(current_weather.sunset).to eq('2021-01-18 14:13:07 -0800')
    expect(current_weather.temperature).to eq(43.86)
    expect(current_weather.feels_like).to eq(31.44)
    expect(current_weather.humiditiy).to eq(33)
    expect(current_weather.uvi).to eq(1.03)
    expect(current_weather.visibility).to eq(10_000)
    expect(current_weather.conditions).to eq('broken clouds')
    expect(current_weather.icon).to eq('04d')
  end
end
