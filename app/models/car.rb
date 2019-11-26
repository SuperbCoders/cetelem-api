# frozen_string_literal: true

class Car < ApplicationRecord
  attr_accessor :wheel, :year
  validates :wheel, inclusion: { in: %i[left right] }

  belongs_to :brand
  belongs_to :model
  belongs_to :modification
  belongs_to :complectation
end
