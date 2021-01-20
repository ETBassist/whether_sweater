module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by('lower(email) = ?',  params[:email].downcase)
        if user && user.authenticate(params[:password])
          render json: UsersSerializer.new(user), status: :ok
        else
          render status: :bad_request, body: 'Invalid Credentials'
        end
      end
    end
  end
end
