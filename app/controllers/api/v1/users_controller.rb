module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)
        user.api_key = SecureRandom.uuid
        user.save
        render json: UsersSerializer.new(user)
      end

      private

      def user_params
        params.require(:body).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
