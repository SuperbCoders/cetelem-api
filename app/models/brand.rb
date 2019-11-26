# frozen_string_literal: true

class Brand < ApplicationRecord
  attr_accessor :name

  validates :name, presence: true
end
