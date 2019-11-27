# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { :user }
    password { 'mUc3m00RsqyRe' }
    password_confirmation { 'mUc3m00RsqyRe' }
    role { 'admin' }
  end
end
