# frozen_string_literal: true

class Api::V1::DealersController < ApplicationController
  def show
    find_dealer do |dealer|
      render json: dealer
    end
  end

  def update
    dealer = Dealer.find(params[:id])

    if dealer.update(dealer_params)
      render json: dealer
    else
      render json: { error: dealer.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def reservations
    return head 404 unless Dealer.exists?(id: params[:dealer_id])

    paginate json: Reservation.for_dealer(params[:dealer_id])
  end

  def cars
    return head 404 unless Dealer.exists?(id: params[:id])

    paginate json: DealerCar.available.where(dealer_id: params[:id])
  end

  def upload_xml
    return 400 unless params[:xml].present?

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

  def dealer_params
    params.permit(:code, :official_dealer, :legal_name, :trade_name, :distributor, :bonus,
                  :bonus_description, :used_car_saling, :rate,
                  marks: [],
                  address_attributes: [:country, :postcode, :region, :city, :street, :building, location: []],
                  contact_infos_attributes: %i[value value_type])
  end
end
