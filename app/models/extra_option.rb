# frozen_string_literal: true

class ExtraOption < ApplicationRecord
  attr_accessor :code, :name
  belongs_to :dealer_car
end
