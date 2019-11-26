# frozen_string_literal: true

class Car < ApplicationRecord
  attr_accessor :wheel, :year

  belongs_to :brand
  belongs_to :model
  belongs_to :modification
  belongs_to :complectation

  validates :year, numericality: { only_integer: true }
  validates :wheel, inclusion: { in: %i[left right] }
end
