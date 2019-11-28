# frozen_string_literal: true

FactoryBot.define do
  factory :complectation do
    name { :Sportline }
    association :modification, factory: :modification
  end
end
