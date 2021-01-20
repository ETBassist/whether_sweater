module Api
  module V1
    class ForecastController < ApplicationController
      def index
        coords = CoordinatesFacade.create_coordinates(location_params)
        forecast = ForecastFacade.create_forecast_for_coordinates(coords[:lat], coords[:lng])
        render json: ForecastSerializer.new(forecast)
      end

      private

      def location_params
        params.require(:location)
      end
    end
  end
end
