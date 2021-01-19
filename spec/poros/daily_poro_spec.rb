require 'rails_helper' 

describe 'Daily PORO' do
  it 'can be created from a weather response' do
    day = {
      "dt": 1610989200,
      "sunrise": 1610972620,
      "sunset": 1611007987,
      "temp": {
        "day": 42.12,
        "min": 34.79,
        "max": 43.86,
        "night": 34.79,
        "eve": 38.34,
        "morn": 34.9
      },
      "feels_like": {
        "day": 31.35,
        "night": 26.06,
        "eve": 29.59,
        "morn": 27.86
      },
      "pressure": 1012,
      "humidity": 58,
      "dew_point": 19.09,
      "wind_speed": 11.9,
      "wind_deg": 279,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": 26,
      "pop": 0,
      "uvi": 1.62
    }

    daily_weather = Daily.new(day)

    expect(daily_weather.date).to eq('2021-01-18 09:00:00 -0800')
    expect(daily_weather.sunrise).to eq('2021-01-18 04:23:40 -0800')
    expect(daily_weather.sunset).to eq('2021-01-18 14:13:07 -0800')
    expect(daily_weather.max_temp).to eq(43.86)
    expect(daily_weather.min_temp).to eq(34.79)
    expect(daily_weather.conditions).to eq('scattered clouds')
    expect(daily_weather.icon).to eq('03d')
  end
end
