# frozen_string_literal: true

class Dealer < ApplicationRecord
  attr_accessor :code, :official_dealer, :legal_name, :trade_name, :distributor,
                :bonus, :bonus_description, :used_car_saling, :brands
  has_one :address, dependent: :destroy
  has_one :working_hour
end
