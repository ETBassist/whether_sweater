module Api
  module V1
    class BackgroundsController < ApplicationController
      def search
        image = ImageFacade.image_search(params[:location])
        render json: ImageSerializer.new(image)
      end
    end
  end
end
