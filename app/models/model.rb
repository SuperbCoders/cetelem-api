# frozen_string_literal: true

class Model < ApplicationRecord
  attr_accessor :name
  belongs_to :brand

  validates :name, presence: true
end
