class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |exception|
    render status: :bad_request, body: 'Missing required parameter'
  end
end
