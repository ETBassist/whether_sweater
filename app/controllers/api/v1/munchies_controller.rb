module Api
  module V1
    class MunchiesController < ApplicationController
      def index
        munchie = MunchieFacade.create_munchie(params)

        render json: MunchieSerializer.new(munchie)
      end
    end
  end
end
