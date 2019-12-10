# frozen_string_literal: true

class Dealer < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :working_hour, dependent: :destroy

  has_many :dealer_cars, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :contact_infos, dependent: :destroy

  has_many_attached :xmls

  accepts_nested_attributes_for :contact_infos, :address

  validates :code, :legal_name, :trade_name, presence: true
  validates :official_dealer, :used_car_saling, inclusion: { in: [true, false] }
end
