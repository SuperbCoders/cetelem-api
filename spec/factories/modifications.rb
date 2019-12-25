# frozen_string_literal: true

FactoryBot.define do
  factory :modification do
    name { '1.4 TSI (150 л.c.)' }
    drive { 'Полный' }
    gearbox { 'Механическая' }
    engine_type { 'Бензин' }
    body_type { 'Внедорожник' }
    association :model, factory: :model
  end
end
