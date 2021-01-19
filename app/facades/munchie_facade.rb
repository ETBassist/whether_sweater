class MunchieFacade
  class << self
    def create_munchie(params)
      directions = MapQuestService.query_direction_data(params[:start], params[:destination])
      time = TripTime.new(directions)
      lat = directions[:route][:locations].last[:latLng][:lat]
      lng = directions[:route][:locations].last[:latLng][:lng]
      weather = OpenWeatherService.get_forecast(lat, lng)
      eta = weather[:current][:dt] + time.time_in_seconds
      yelp = YelpService.query_business_search(params[:destination], params[:food], eta)
      Munchie.new(yelp[:businesses][0], time, weather)
    end
  end
end
