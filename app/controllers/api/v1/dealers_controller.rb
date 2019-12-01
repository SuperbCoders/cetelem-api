# frozen_string_literal: true

class Api::V1::DealersController < ApplicationController
  def show
    find_dealer do |dealer|
      render json: dealer
    end
  end

  def reservations
    return head 400 unless Dealer.exists?(id: params[:dealer_id])

    render json: Reservation.for_dealer(params[:dealer_id])
  end

  def cars
    return head 400 unless Dealer.exists?(id: params[:id])

    render json: DealerCar.available.where(dealer_id: params[:id])
  end

  def upload_xml
    find_dealer do |dealer|
      dealer.xmls.attach(params[:xml])
      DealerCarUploadJob.perform_later(dealer.xmls.last, dealer)
    end

    head :accepted
  end

  private

  def find_dealer
    @dealer = Dealer.find(params[:id])
    yield(@dealer) if block_given?
  end
end
