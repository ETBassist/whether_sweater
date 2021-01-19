class Daily
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon
  
  def initialize(daily_weather)
    @date = Time.at(daily_weather[:dt])
    @sunrise = Time.at(daily_weather[:sunrise])
    @sunset = Time.at(daily_weather[:sunset])
    @max_temp = daily_weather[:temp][:max]
    @min_temp = daily_weather[:temp][:min]
    @conditions = daily_weather[:weather].first[:description]
    @icon = daily_weather[:weather].first[:icon]
  end
end
