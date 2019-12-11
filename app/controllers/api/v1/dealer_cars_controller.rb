# frozen_string_literal: true

class Api::V1::DealerCarsController < ApplicationController
  # before_action :authorize_by_access_cookie!, only: :book

  def index
    cars = DealerCar.available
                    .where_dealer_car(dealer_car_params).where_car(car_params).where_modifications(modification_params)

    paginate json: cars
  end

  def show
    find_car do |car|
      render json: car.full
    end
  end

  def book
    find_car do |car|
      return head 403 if car.reservation.present?

      params.require(:name, :phone)
      reservation = car.create_reservation(params.permit(:name, :phone, :email, :client_id))

      render json: reservation, status: 201
    end
  end

  def destroy
    DealerCar.find(params[:id]).destroy

    head :no_content
  end

  def destroy_list
    return head 400 unless Dealer.exists?(id: params[:dealer_id])

    DealerCar.available.where(dealer_id: params[:dealer_id]).destroy_all

    head :no_content
  end

  private

  def find_car
    @car = DealerCar.find(params[:id])
    yield(@car) if block_given?
  end

  def car_params
    params.permit(:mark_id, :model_id, :modification_id, :complectation_id)
  end

  def modification_params
    new = params.permit(:body_type)
    new.merge!(engine_hp: params[:engine_hp][:min].to_i..params[:engine_hp][:max].to_i) if params[:engine_hp]
    new.merge!(engine_volume: params[:engine_volume][:min].to_i..params[:engine_volume][:max].to_i) if params[:engine_volume]

    new
  end

  def dealer_car_params
    new = params.permit(:dealer_id, :color, :wheel, :engine_type, :state, :new)
    new.merge!(year: params[:year][:min].to_i..params[:year][:max].to_i) if params[:year]
    new.merge!(price: params[:price][:min].to_i..params[:price][:max].to_i) if params[:price]
    new.merge!(run: params[:run][:min].to_i..params[:run][:max].to_i) if params[:run]

    new
  end
end
