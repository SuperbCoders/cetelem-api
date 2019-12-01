# frozen_string_literal: true

class Api::V1::DealerCarsController < ApplicationController
  def index
    render json: DealerCar.available.all
  end

  def show
    find_car do |car|
      render json: car
    end
  end

  def book
    find_car do |car|
      return head 400 unless User.exists?(id: params[:user_id])

      car.create_reservation(user_id: params[:user_id])
      head :created
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

  def filters
  end

  private

  def find_car
    @car = DealerCar.find(params[:id])
    yield(@car) if block_given?
  end
end