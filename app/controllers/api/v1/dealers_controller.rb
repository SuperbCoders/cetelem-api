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
    id = params[:dealer_id] || params[:id]
    return head 404 unless Dealer.exists?(id: id)

    paginate json: Reservation.for_dealer(id)
  end

  def cars
    cars = Dealer.find(params[:id]).all_cars.available

    paginate json: cars
  end

  def statistics
    find_dealer do |dealer|
      response = {
        cars_total: dealer.all_cars.count,
        reservations_total: Reservation.for_dealer(dealer.id).where(created_at: Date.today.beginning_of_week..Time.now).count
       }
      render json: response
    end
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
