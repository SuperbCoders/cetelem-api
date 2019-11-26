# frozen_string_literal: true

FactoryBot.define do
  factory :contact_info do
    value { '8-919-999-99-99' }
    value_type { :phone }
  end
end
