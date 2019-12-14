# frozen_string_literal: true

FactoryBot.define do
  factory :dealer_group do
    name { "Test Group" }

    after(:create) do |group|
      group.dealers << create(:dealer)
    end
  end
end
