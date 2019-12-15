# frozen_string_literal: true

FactoryBot.define do
  factory :default_filter do
    title { 'Test' }
    data { {mark_id: 1, new: 1} }
  end
end
