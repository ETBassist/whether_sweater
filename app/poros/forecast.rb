class Forecast
  attr_reader :current_weather,
              :hourly_weather,
              :daily_weather,
              :id,
              :type

  def initialize(data)
    @id = nil
    @current_weather = create_current_weather(data[:current])
    @hourly_weather = create_hourly_weather(data[:hourly])
    @daily_weather = create_daily_weather(data[:daily])
  end

  private

  def create_current_weather(data)
    Current.new(data)
  end

  def create_hourly_weather(data)
    data[0..7].map do |hour|
      Hourly.new(hour)
    end
  end

  def create_daily_weather(data)
    data[0..4].map do |day|
      Daily.new(day)
    end
  end
end
