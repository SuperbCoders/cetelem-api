# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    country { 'РФ' }
    postcode { '111245' }
    region { 'Московская Область' }
    city { 'Москва' }
    street { 'wcsa' }
    building { '21' }
    location { [21.21, 45.33] }

    association :dealer, factory: :dealer
  end
end
