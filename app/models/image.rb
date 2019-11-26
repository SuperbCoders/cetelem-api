# frozen_string_literal: true

class Image < ApplicationRecord
  attr_accessor :url
  belongs_to :dealer_car
end
