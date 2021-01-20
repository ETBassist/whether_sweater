class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |exception|
    render status: :bad_request, body: { data: 'Missing required parameter' }.to_json
  end
end
