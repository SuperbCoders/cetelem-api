# frozen_string_literal: true

class Complectation < ApplicationRecord
  belongs_to :model

  validates :name, presence: true
end
