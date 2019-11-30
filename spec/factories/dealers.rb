# frozen_string_literal: true

FactoryBot.define do
  factory :dealer do
    code { 12_356 }
    official_dealer { true }
    legal_name { 'Германика' }
    trade_name { 'Германика' }
    distributor { 'VAG' }
    bonus { true }
    bonus_description { 'Дарим бонус при покупке' }
    used_car_saling { false }
    marks { %w[volkswagen skoda] }

    trait :full do
      after(:create) do |dealer, _evaluator|
        create(:address, dealer_id: dealer.id)
        create(:working_hour, dealer_id: dealer.id)
      end
    end
  end
end
