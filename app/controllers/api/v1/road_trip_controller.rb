module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        user = User.find_by(api_key: params[:api_key])
        if user
          roadtrip = RoadTripFacade.create_road_trip(params)
          render json: RoadTripSerializer.new(roadtrip)
        end
      end
    end
  end
end
