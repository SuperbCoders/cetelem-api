# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    url { 'rvdsvfreds/rwed' }

    association :dealer_car, factory: :dealer_car
  end
end
