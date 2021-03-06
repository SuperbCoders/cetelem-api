# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  include ActionController::Caching
  include ActionController::Serialization
  include Rails::Pagination

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

  def paginate(collection)
    per_page = (params[:per_page] || WillPaginate.per_page).to_i
    number = collection[:json].size / per_page
    number += 1 if (collection[:json].size % per_page) > 0

    response.set_header('X-Pages-Number', number)

    super(collection)
  end

  def set_default_response_format
    request.format = :json unless request.format.symbol == :xls
  end

  private

  def authenticate_for_role(role)
    head :forbidden unless payload['roles'].include?(role.to_s)
  end

  def current_user
    @current_user ||= User.find_by(id: payload['user_id'])
    rescue JWTSessions::Errors::Unauthorized
      nil
  end
end
