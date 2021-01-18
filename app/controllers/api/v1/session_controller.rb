module Api
  module V1
    class SessionController < ApplicationController
      def create
        user = User.find_by('lower(email) = ?',  params[:body][:email].downcase)
        if user && user.authenticate(params[:body][:password])
          render json: UsersSerializer.new(user), status: :ok
        else
          render status: :bad_request, body: 'Invalid Credentials'
        end
      end
    end
  end
end
