# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    year { 2019 }
    wheel { :left }

    association :brand, factory: :brand
    association :model, factory: :model
    association :modification, factory: :modification
    association :complectation, factory: :complectation
  end
end
