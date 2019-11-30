# frozen_string_literal: true

FactoryBot.define do
  factory :extra_option do
    type { 'Обзор' }
    sequence(:name) { |n| "name_#{n}" }
  end
end
