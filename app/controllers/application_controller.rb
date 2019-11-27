# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization

  rescue_from ActionController::ParameterMissing do |_exception|
    head :bad_request
  end

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    head :not_found
  end

  rescue_from JWTSessions::Errors::Unauthorized do |_exception|
    render json: { error: 'Not authorized' }, status: :unauthorized
  end
end
