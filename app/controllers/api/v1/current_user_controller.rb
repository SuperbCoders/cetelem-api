# frozen_string_literal: true

class Api::V1::CurrentUserController < ApplicationController
  before_action :authorize_by_access_cookie!

  def index
    render json: current_user
  end
end
