# frozen_string_literal: true

FactoryBot.define do
  factory :modification do
    name { '1.4 TSI (150)' }
    drive { :awd }
    gearbox { :robot }
    engine_type { :gasolene }
    body_type { 'Внедорожник' }
    association :model, factory: :model
  end
end
