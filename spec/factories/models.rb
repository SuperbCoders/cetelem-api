# frozen_string_literal: true

FactoryBot.define do
  factory :model do
    name { :Tiguan }
    association :mark, factory: :mark
  end
end
