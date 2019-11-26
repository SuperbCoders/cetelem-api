# frozen_string_literal: true

class User < ApplicationRecord
  has_one :contact_info
end
