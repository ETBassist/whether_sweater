module Api
  module V1
    class MunchiesController < ApplicationController
      def index
        time = TimeFacade.query_direction_time_data(params[:start], params[:destination])
        coords = CoordinatesFacade.create_coordinates(params[:destination])
        weather = WeatherService.get_forecast(coords[:lat], coords[:lng])
      end
    end
  end
end
