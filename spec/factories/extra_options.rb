# frozen_string_literal: true

FactoryBot.define do
  factory :extra_option do
    code { 'AC3' }
    name { 'Сиситема курсовой устойчивости' }

    association :dealer_car, factory: :dealer_car
  end
end
