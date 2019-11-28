# frozen_string_literal: true

class Api::V1::DealersController < ApplicationController
  def show
    find_dealer do |dealer|
      render json: dealer.as_json
    end
  end

  def reservations
    return head 400 unless Dealer.exists?(id: params[:dealer_id])

    render json: Reservation.for_dealer(params[:dealer_id]).as_json
  end

  def cars
    return head 400 unless Dealer.exists?(id: params[:id])

    render json: DealerCar.available.where(dealer_id: params[:id]).as_json
  end

  def upload_xml
    head 202
  end

  private

  def find_dealer
    dealer = Dealer.find(params[:id])
    yield(dealer)
  end
end
