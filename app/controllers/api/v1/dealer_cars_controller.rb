# frozen_string_literal: true

class Api::V1::DealerCarsController < ApplicationController
  # before_action :authorize_by_access_cookie!, only: :book

  def index
    cars =
      (params[:dealer_id] ? Dealer.find(params[:dealer_id]).all_cars : DealerCar).
        available.
        where_dealer_car(dealer_car_params).
        where_car(car_params).
        where_modifications(modification_params)

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

      params.require(%i[name phone])
      reservation = car.create_reservation(params.permit(:name, :phone, :email, :client_id))

      render json: reservation, status: 201
    end
  end

  def destroy
    DealerCar.find(params[:id]).destroy

    head :no_content
  end

  def destroy_list
    if params[:dealer_id]
      Dealer.find(params[:dealer_id]).cars.available.destroy_all
    elsif params[:dealer_group_id]
      DealerGroup.find(params[:dealer_group_id]).cars.available.destroy_all
    else
      return head :bad_request
    end

    head :no_content
  end

  private

  def find_car
    @car = DealerCar.find(params[:id])
    yield(@car) if block_given?
  end

  def car_params
    params.permit(:mark_id, :model_id, :modification_id, :complectation_id).to_h
  end

  def modification_params
    new = params.permit(:body_type)
    new.merge!(engine_hp: params[:engine_hp][:min].to_i..params[:engine_hp][:max].to_i) if params[:engine_hp]
    new.merge!(engine_volume: params[:engine_volume][:min].to_i..params[:engine_volume][:max].to_i) if params[:engine_volume]

    new.to_h
  end

  def dealer_car_params
    new = params.permit(:color, :wheel, :engine_type, :state, :new, :availability, :region_id)
    new.merge!(year: (params[:year][:min] || 0).to_i..(params[:year][:max]|| 999_999_999).to_i) if params[:year]
    new.merge!(price:(params[:price][:min] || 0).to_i..(params[:price][:max] || 999_999_999).to_i) if params[:price]
    new.merge!(run: (params[:run][:min] || 0).to_i..(params[:run][:max]|| 999_999_999).to_i) if params[:run]

    new.to_h
  end
end
