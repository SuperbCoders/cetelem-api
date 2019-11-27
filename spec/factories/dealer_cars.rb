# frozen_string_literal: true

FactoryBot.define do
  factory :dealer_car do
    color { '0R0R' }
    metallic { true }
    availability { 'в наличии' }
    custom { true }
    owners_number { 0 }
    price { 2_000_000 }
    credit_discount { 100_000 }
    insurance_discount { 100_000 }
    tradein_discount { 100_000 }
    max_discount { 300_000 }
    currency { 'rub' }
    description { 'Продажа авто' }
    registry_year { 2019 }
    vin { 'WVWZ****ZJE2*****' }

    association :car, factory: :car
    association :dealer, factory: :dealer
  end

  trait :with_reservation do
    after(:create) do |dealer_car, _evaluator|
      create(:reservation, dealer_car_id: dealer_car.id)
    end
  end
end
