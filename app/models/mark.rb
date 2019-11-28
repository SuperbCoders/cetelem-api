# frozen_string_literal: true

class Mark < ApplicationRecord
  has_many :models
  validates :name, presence: true
end
