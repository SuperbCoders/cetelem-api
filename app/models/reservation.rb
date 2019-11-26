# frozen_string_literal: true

class Reservation < ApplicationRecord
  attr_accessor :phone, :email

  belongs_to :user
  belongs_to :dealer_car

  scope :for_dealer, ->(dealer_id) { joins(:dealer_car).where('dealer_cars.dealer_id' => dealer_id) }
end
