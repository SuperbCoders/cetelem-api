# frozen_string_literal: true

class Reservation < ApplicationRecord
  attr_accessor :phone, :email

  belongs_to :user
  belongs_to :dealer_car
end
