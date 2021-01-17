class Forecast
  attr_reader :current_weather,
              :hourly_weather,
              :daily_weather,
              :id,
              :type

  def initialize(data)
    @id = nil
    @type = 'forecast'
    @current_weather = create_current_weather(data)
    @hourly_weather = create_hourly_weather(data)
    @daily_weather = create_daily_weather(data)
  end

  private

  def create_current_weather(data)
    { 
      datetime: Time.at(data[:current][:dt]).to_s,
      sunrise: Time.at(data[:current][:sunrise]).to_s,
      sunset: Time.at(data[:current][:sunset]).to_s,
      temperature: data[:current][:temp],
      feels_like: data[:current][:feels_like].to_f,
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
      wind_speed: "#{hour[:wind_speed]} mph",
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
        sunrise: Time.at(day[:sunrise]).to_s,
        sunset: Time.at(day[:sunset]).to_s,
        max_temp: day[:temp][:max].to_f,
        min_temp: day[:temp][:min].to_f,
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
