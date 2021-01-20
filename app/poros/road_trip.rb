class RoadTrip
  attr_reader :id,
              :type,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(origin_params, time, weather)
    @id = nil
    @type = 'roadtrip'
    @start_city = origin_params[:origin]
    @end_city = origin_params[:destination]
    @travel_time = time.travel_time
    @weather_at_eta = parse_weather(weather, time)
  end

  private 

  def parse_weather(weather, time)
    if time.time_in_seconds
      arrival_hour = (Time.at(weather[:current][:dt]) + time.time_in_seconds.seconds).strftime("%H")
      forecast = weather[:hourly].find do |hour|
        Time.at(hour[:dt]).strftime("%H") == arrival_hour
      end
      {
        temperature: forecast[:temp],
        conditions: forecast[:weather].first[:description]
      }
    else
      {}
    end
  end
end
