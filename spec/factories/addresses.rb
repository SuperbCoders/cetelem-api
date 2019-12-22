# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    country { 'РФ' }
    postcode { '111245' }
    region { 'Москва' }
    city { 'Москва' }
    street { 'wcsa' }
    building { '21' }
    location { [21.21, 45.33] }
    region_id { 7700000000000 }
    city_id { 7700000000000 }

    association :dealer, factory: :dealer
  end
end
