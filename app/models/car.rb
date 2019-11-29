# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :mark
  belongs_to :model
  belongs_to :modification
  belongs_to :complectation, optional: true

  # validates :year, numericality: { only_integer: true }
  # validates :wheel, inclusion: { in: %i[left right] }
end
