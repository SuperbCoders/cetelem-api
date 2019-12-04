# frozen_string_literal: true

class Mark < ApplicationRecord
  has_many :models
  has_many :cars

  validates :name, presence: true
end
