class Hourly
  attr_reader :time,
              :temperature,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(hour)
    @time = Time.at(hour[:dt]).strftime("%k:%M:%S")
    @temperature = hour[:temp]
    @wind_speed = "#{ hour[:wind_speed] } mph"
    @wind_direction = calculate_direction(hour[:wind_deg])
    @conditions = hour[:weather].first[:description]
    @icon = hour[:weather].first[:icon]
  end
  
  private

  def calculate_direction(wind_deg)
    compass = %w(N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW)
    compass_sector = (wind_deg / 22.5) + 0.5
    compass[(compass_sector % 16).round]
  end
end
