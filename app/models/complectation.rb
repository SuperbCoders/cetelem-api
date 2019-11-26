# frozen_string_literal: true

class Complectation < ApplicationRecord
  attr_accessor :name

  belongs_to :model

  validates :name, presence: true
end
