# frozen_string_literal: true

class Api::V1::Filters::DealerCarsController < ApplicationController
  def index
    response = {
      color:
        { type: 'SELECT', text: 'Цвет', options: DealerCar::COLORS },
      wheel:
        { type: 'SELECT', text: 'Руль', options: DealerCar::WHEELS },
      engine_type:
        { type: 'SELECT', text: 'Двигатель', options: Modification::ENGINE_TYPES },
      state:
        { type: 'SELECT', text: 'Состояние', options: DealerCar::STATES },
      availability:
        { type: 'SELECT', text: 'Наличие', options: DealerCar::AVAILABILITY },
      new:
        { type: 'BOOLEAN', text: 'Новые', options: [true, false] },
      year:
        { type: 'RANGE', text: 'Год', min: DealerCar.minimum(:year), max: DealerCar.maximum(:year) },
      price:
        { type: 'RANGE', text: 'Цена', min: DealerCar.minimum(:price), max: DealerCar.maximum(:price) },
      run:
        { type: 'RANGE', text: 'Цена', min: DealerCar.minimum(:run), max: DealerCar.maximum(:run) },
      body_type:
        { type: 'SELECT', text: 'Кузов', options: Modification::BODY_TYPES },
      engine_hp:
        { type: 'RANGE', text: 'Мощность (в л/с)', min: 0, max: 5_000 },
      engine_volume:
        { type: 'RANGE', text: 'Объем двигателя', min: 0, max: 10 },
      drive:
        { type: 'SELECT', text: 'Привод', options: Modification::DRIVE },
      gearbox:
        { type: 'SELECT', text: 'Коробка передач', options: Modification::GEARBOXES }
    }

    render json: response
  end
end
