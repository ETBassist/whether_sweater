class Forecast
  attr_reader :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(data)
    @current_weather = create_current_weather(data)
    @hourly_weather = create_hourly_weather(data)
    @daily_weather = create_daily_weather(data)
  end

  private

  def create_current_weather(data)
    { 
      datetime: Time.at(data[:current][:dt]),
      sunrise: Time.at(data[:current][:sunrise]),
      sunset: Time.at(data[:current][:sunset]),
      temperature: data[:current][:temp],
      feels_like: data[:current][:feels_like],
      humidity: data[:current][:humidity],
      uvi: data[:current][:uvi],
      visibility: data[:current][:visibility],
      conditions: data[:current][:weather][0][:description],
      icon: data[:current][:weather][0][:icon]
    }
  end

  def create_hourly_weather(data)
    data[:hourly][0..7].map do |hour|
    {
      time: Time.at(hour[:dt]).strftime("%k:%M:%S"),
      temperature: hour[:temp],
      wind_speed: hour[:wind_speed],
      wind_direction: calculate_direction(hour[:wind_deg]),
      conditions: hour[:weather][0][:description],
      icon: hour[:weather][0][:icon]
    }
    end
  end

  def create_daily_weather(data)
    data[:daily][0..4].map do |day|
      {
        date: Time.at(day[:dt]).strftime("%Y-%m-%d"),
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def calculate_direction(wind_deg)
    compass = %w(N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW)
    compass_sector = (wind_deg / 22.5) + 0.5
    compass[compass_sector % 16]
  end
end
