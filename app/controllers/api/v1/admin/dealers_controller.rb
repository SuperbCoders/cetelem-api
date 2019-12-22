# frozen_string_literal: true

class Api::V1::Admin::DealersController < ApplicationController
  before_action do
    authorize_by_access_cookie!
    authenticate_for_role(:admin)
  end

  def index
    paginate json: Dealer.all
  end

  def create
    dealer = Dealer.new(dealer_params)

    if dealer.save
      render json: dealer
    else
      render json: { error: dealer.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def show
    render json: Dealer.find(params[:id])
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

  def destroy
    Dealer.find(params[:id]).destroy

    head 204
  end

  private

  def dealer_params
    params.permit(:code, :official_dealer, :legal_name, :trade_name, :distributor, :bonus,
                  :bonus_description, :used_car_saling, :rate, :dealer_group_id,
                  marks: [],
                  address_attributes: [:country, :postcode, :region, :city, :region_id, :city_id, :street, :building, location: []],
                  contact_infos_attributes: %i[value value_type])
  end
end
