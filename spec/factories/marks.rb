# frozen_string_literal: true

FactoryBot.define do
  factory :mark do
    sequence(:name) { |n| "Volkswagen#{n}" }
  end
end
