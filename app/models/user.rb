# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false

  has_one :contact_info

  enum role: %i[user dealer admin].freeze

  validates :login, presence: true, uniqueness: { case_sensitive: false }
  validates :role, presence: true
end
