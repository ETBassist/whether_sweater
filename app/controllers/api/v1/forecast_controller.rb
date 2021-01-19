module Api
  module V1
    class ForecastController < ApplicationController
      def index
        coords = CoordinatesFacade.create_coordinates(params[:location])
        forecast = ForecastFacade.create_forecast_for_coordinates(coords[:lat], coords[:lng])
        render json: ForecastSerializer.new(forecast)
      end
    end
  end
end
