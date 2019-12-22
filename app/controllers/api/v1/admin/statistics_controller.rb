# frozen_string_literal: true

class Api::V1::Admin::StatisticsController < ApplicationController
  before_action do
    authorize_by_access_cookie!
    authenticate_for_role(:admin)
  end

  def index
    response = {
      cars_total: DealerCar.count,
      reservations_total: Reservation.since(Date.today - 14.days).count,
      statistics: Reservation.full_statistics
     }

     render json: response
  end
end
