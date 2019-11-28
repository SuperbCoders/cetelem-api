# frozen_string_literal: true

class Dealer < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :working_hour

  validates :code, :legal_name, :trade_name, presence: true
  validates :official_dealer, :used_car_saling, inclusion: { in: [true, false] }
end
