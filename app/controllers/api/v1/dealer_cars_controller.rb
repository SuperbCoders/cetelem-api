# frozen_string_literal: true

class Api::V1::DealerCarsController < ApplicationController
  def index
    render json: DealerCar.all.as_json
  end

  def show
    find_car do |car|
      render json: car.as_json
    end
  end

  def book
    find_car do |car|
      return head 400 unless User.exists?(id: params[:user_id])

      car.create_reservation(user_id: params[:user_id])
      head :created
    end
  end

  private

  def find_car
    car = DealerCar.find(params[:id])
    yield(car)
  end
end
