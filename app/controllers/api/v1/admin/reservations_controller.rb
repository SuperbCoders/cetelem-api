# frozen_string_literal: true

class Api::V1::Admin::ReservationsController < ApplicationController
  before_action do
    authorize_by_access_cookie!
    authenticate_for_role(:admin)
  end

  def index
    paginate json: Reservation.all
  end

  def show
    Reservation.find(params[:id])
  end
end
