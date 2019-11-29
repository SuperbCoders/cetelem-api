# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    association :mark, factory: :mark
    association :model, factory: :model
    association :modification, factory: :modification
    association :complectation, factory: :complectation
  end
end
