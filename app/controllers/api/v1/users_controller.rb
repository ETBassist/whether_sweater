module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)
        user.api_key = SecureRandom.uuid
        if user.save
          render json: UsersSerializer.new(user), status: :created
        else
          render status: :bad_request, body: user.errors.full_messages.to_sentence
        end
      end

      private

      def user_params
        params.require(:body).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
