# frozen_string_literal: true

class Api::V1::Filters::DealerCarsController < ApplicationController
  def index
    response = {
      color:
        { type: 'SELECT', text: 'Цвет', options: DealerCar::COLORS },
      wheel:
        { type: 'SELECT', text: 'Руль', options: DealerCar::WHEELS },
      engine_type:
        { type: 'SELECT', text: 'Двигатель', options: DealerCar::ENGINE_TYPES },
      year:
        { type: 'RANGE', text: 'Год', min: 1990, max: Date.today.year },
      price:
        { type: 'RANGE', text: 'Цена', min: DealerCar.minimum(:price), max:DealerCar.maximum(:price) }
      }

    render json: response
  end
end
