# frozen_string_literal: true

class Api::V1::Admin::DealerCarsController < ApplicationController
  before_action do
    authorize_by_access_cookie!
    authenticate_for_role(:admin)
  end

  def index
    paginate json: DealerCar.all
  end

  def create
    dealer_car = DealerCar.new(car_params)

    if dealer_car.save
      render json: dealer_car
    else
      render json: { error: dealer_car.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def show
    render json: DealerCar.find(params[:id])
  end

  def update
    dealer_car = DealerCar.find(params[:id])

    if dealer_car.update(car_params)
      render json: dealer_car
    else
      render json: { error: dealer_car.errors.full_messages.join(' ') },
             status: :unprocessable_entity
    end
  end

  def destroy
    DealerCar.find(params[:id]).destroy

    head 204
  end

  private

  def car_params
    params.permit(:dealer_id, :car_id,
                  :color, :metallic, :availability, :custom,
                  :owners_number, :price, :credit_discount,
                  :insurance_discount, :tradein_discount, :max_discount,
                  :currency, :description, :registry_year, :vin)
  end
end
