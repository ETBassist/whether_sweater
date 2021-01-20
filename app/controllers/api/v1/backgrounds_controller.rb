module Api
  module V1
    class BackgroundsController < ApplicationController
      def search
        image = ImageFacade.image_search(location_params)
        render json: ImageSerializer.new(image)
      end

      private

      def location_params
        params.require(:location)
      end
    end
  end
end
