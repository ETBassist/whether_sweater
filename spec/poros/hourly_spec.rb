require 'rails_helper'

describe 'Hourly Weather PORO' do
  it 'is has the desired attributes' do
    hour = {
      "dt": 1610996400,
      "temp": 43.86,
      "feels_like": 32.25,
      "pressure": 1011,
      "humidity": 33,
      "dew_point": 18.36,
      "uvi": 1.03,
      "clouds": 75,
      "visibility": 10000,
      "wind_speed": 11.23,
      "wind_deg": 279,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "pop": 0
    }

    hourly = Hourly.new(hour)

    expect(hourly.time).to eq('11:00:00')
    expect(hourly.temperature).to eq(43.86)
    expect(hourly.wind_speed).to eq('11.23 mph')
    expect(hourly.wind_direction).to eq('WNW')
    expect(hourly.conditions).to eq('broken clouds')
    expect(hourly.icon).to eq('04d')
  end
end
