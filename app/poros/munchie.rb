class Munchie
  attr_reader :destination_city,
              :travel_time,
              :forecast,
              :restaurant,
              :id,
              :type

  def initialize(yelp_response, time, weather)
    @id = nil
    @type = 'munchie'
    @destination_city = "#{yelp_response[:location][:city]}, #{yelp_response[:location][:state]}"
    @travel_time = format_time(time.time_in_seconds)
    @forecast = find_weather(weather, time)
    @restaurant = format_restaurant(yelp_response)
  end

  private

  def format_time(time)
    "#{ time / 3600 } hours #{ (time % 3600) / 60 } min"
  end

  def find_weather(weather, time)
    arrival_hour = (Time.at(weather[:current][:dt]) + time.time_in_seconds.seconds).strftime("%H")
    forecast = weather[:hourly].find do |hour|
      Time.at(hour[:dt]).strftime("%H") == arrival_hour
    end
    {
      summary: forecast[:weather].first[:description],
      temperature: "#{forecast[:temp]}"
    }
  end

  def format_restaurant(yelp_response)
    {
      name: yelp_response[:name],
      address: yelp_response[:location][:display_address].join(', ')
    }

  end
end
