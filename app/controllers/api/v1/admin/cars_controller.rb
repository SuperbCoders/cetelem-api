class Api::V1::Admin::CarsController < ApplicationController
  def index
    render json: Car.all
  end

  def show
    find_car do |car|
      render json: car
    end
  end

  def update
    find_car do |car|
      car.full_update(car_params)

      render json: car
    end
  end

  def destroy
    find_car do |car|
      car.destroy
      head 204
    end
  end

  private

  def car_params
    params.permit(:mark, :model, :modification, :complectation)
  end

  def find_car
    @car = Car.find(params[:id])
    yield(@car) if block_given?
  end
end
