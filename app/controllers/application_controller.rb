# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  include ActionController::ImplicitRender
  include ActionController::Caching

  before_action :set_default_response_format


  rescue_from ActionController::ParameterMissing do |_exception|
    head :bad_request
  end

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    head :not_found
  end

  rescue_from JWTSessions::Errors::Unauthorized do |_exception|
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  protected

  def set_default_response_format
    request.format = :json
  end

  private

  def authenticate_for_role(role)
    head :forbidden unless payload['roles'].include?(role.to_s)
  end

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
end
