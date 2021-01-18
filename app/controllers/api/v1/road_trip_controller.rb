module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        user = User.find_by(api_key: params[:body][:api_key])
        if user
          coords = CoordinatesFacade.create_coordinates(params[:body][:destination])
          time = TimeFacade.query_direction_time_data(params[:body][:origin], params[:body][:destination])
          weather = OpenWeatherService.get_forecast(coords[:lat], coords[:lng])
          arrival_hour = (Time.at(weather[:current][:dt]) + time.time_in_seconds.seconds).strftime("%H")

          forecast = weather[:hourly].find do |hour|
            Time.at(hour[:dt]).strftime("%H") == arrival_hour
          end
          require "pry";binding.pry 
          #TODO: create RoadTrip PORO and facade
          # call the above facades from within there
        end
      end
    end
  end
end
