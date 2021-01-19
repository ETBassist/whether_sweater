class Current
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(current_weather)
    @datetime = Time.at(current_weather[:dt]).to_s
    @sunrise = Time.at(current_weather[:sunrise]).to_s
    @sunset = Time.at(current_weather[:sunset]).to_s
    @temperature = current_weather[:temp]
    @feels_like = current_weather[:feels_like]
    @humidity = current_weather[:humidity]
    @uvi = current_weather[:uvi]
    @visibility = current_weather[:visibility]
    @conditions = current_weather[:weather].first[:description]
    @icon = current_weather[:weather].first[:icon]
  end
end
