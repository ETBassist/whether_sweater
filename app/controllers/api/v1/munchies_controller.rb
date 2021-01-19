module Api
  module V1
    class MunchiesController < ApplicationController
      def index
        time = TimeFacade.query_direction_time_data(params[:start], params[:destination])
        coords = CoordinatesFacade.create_coordinates(params[:destination])
        weather = OpenWeatherService.get_forecast(coords[:lat], coords[:lng])
        eta = weather[:current][:dt] + time.time_in_seconds
        yelp = YelpService.query_business_search(params[:destination], params[:food], eta)
        munchie = Munchie.new(yelp[:businesses][0], time, weather)

        render json: MunchieSerializer.new(munchie)
      end
    end
  end
end
