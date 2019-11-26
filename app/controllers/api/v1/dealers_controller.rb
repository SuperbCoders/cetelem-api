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

  private

  def find_dealer
    dealer = Dealer.find(params[:id])
    yield(dealer)
  end
end
