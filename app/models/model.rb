# frozen_string_literal: true

class Model < ApplicationRecord
  belongs_to :mark
  has_many :modifications
  has_many :complectations

  validates :name, presence: true
end
