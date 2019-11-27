# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token
  has_one :contact_info
end
