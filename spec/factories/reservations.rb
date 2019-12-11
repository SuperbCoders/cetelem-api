# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    phone { '8-999-999-99-99' }
    email { 'example@com' }
    name { 'Alex' }

    association :dealer_car, factory: :dealer_car
    # association :user, factory: :user
  end
end
