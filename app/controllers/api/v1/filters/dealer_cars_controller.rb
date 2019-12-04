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
      state:
        { type: 'SELECT', text: 'Состояние', options: DealerCar::STATES },
      new:
        { type: 'BOOLEAN', text: 'Новые', options: [true, false] },
      year:
        { type: 'SELECT', text: 'Год', options: (1890..Date.today.year).to_a },
      price:
        { type: 'RANGE', text: 'Цена', min: 1, max: 1_000_000_000 },
      run:
        { type: 'RANGE', text: 'Цена', min: 0, max: 1_000_000 },
      'modifications.body_type':
        { type: 'SELECT', text: 'Руль', options: Modification::BODY_TYPES },
      'modifications.engine_hp':
        { type: 'RANGE', text: 'Мощность (в л/с)', min: 0, max: 5_000 },
      'modifications.engine_volume':
        { type: 'SELECT', text: '', options: (0.2..10.0).step(0.2).map { |i| i.round(1) } }
      }

    render json: response
  end
end
