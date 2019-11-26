# frozen_string_literal: true

class Complectation < ApplicationRecord
  attr_accessor :name
  belongs_to :model
end
