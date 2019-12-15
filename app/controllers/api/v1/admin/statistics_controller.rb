# frozen_string_literal: true

class Api::V1::Admin::ReservationsController < ApplicationController
  before_action do
    authorize_by_access_cookie!
    authenticate_for_role(:admin)
  end

  def index
    response = {
      cars_total: DealerCar.count,
      reservations_total: Reservation.count
     }

     render json: response
  end
end
