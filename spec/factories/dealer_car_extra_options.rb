# frozen_string_literal: true

FactoryBot.define do
  factory :dealer_car_extra_option do
    association :extra_option, factory: :extra_option
    association :dealer_car, factory: :dealer_car
  end
end
