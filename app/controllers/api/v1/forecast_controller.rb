module Api
  module V1
    class ForecastController < ApplicationController
      def index
        coords = CoordinatesFacade.create_coordinates(params[:location])
        result = OpenWeatherService.get_forecast(coords[:lat], coords[:lng])
      end
    end
  end
end
