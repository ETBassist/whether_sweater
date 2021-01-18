class RoadTrip
  attr_reader :id,
              :type,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(origin_params, travel_time, forecast)
    @id = nil
    @type = 'roadtrip'
    @start_city = origin_params[:origin]
    @end_city = origin_params[:destination]
    @travel_time = travel_time
    @weather_at_eta = parse_weather(forecast)
  end

  private 

  def parse_weather(forecast)
    {
      temperature: forecast[:temp],
      conditions: forecast[:weather].first[:description]
    }
  end
end
