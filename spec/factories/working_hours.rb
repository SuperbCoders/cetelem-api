# frozen_string_literal: true

FactoryBot.define do
  factory :working_hour do
    mon_fr_from { 10 }
    mon_fr_till { 21 }
    sat_from { 10 }
    sat_till { 18 }
    sun_from { 10 }
    sun_till { 16 }

    association :dealer, factory: :dealer
  end
end
