# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    country { 'РФ' }
    postcode { '111245' }
    region { 'Московская Область' }
    distriсt { 'Восточный' }
    area { '' }
    city { 'Москва' }
    locality { '' }
    building { '21' }
    region_code { 44 }
    # location { '' }
    association :dealer, factory: :dealer
  end
end
