class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attribute :current_weather do |weather|
    weather.current_weather
  end

  attribute :hourly_weather do |weather|
    weather.hourly_weather.each do |hour|
      hour
    end
  end

  attribute :daily_weather do |weather|
    weather.daily_weather.each do |day|
      day
    end
  end
end
