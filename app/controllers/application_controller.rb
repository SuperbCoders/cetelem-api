# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |_exception|
    head :bad_request
  end

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    head :not_found
  end
end
