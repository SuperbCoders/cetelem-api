# frozen_string_literal: true

class DealerCar < ApplicationRecord
  attr_accessor :color, :metallic, :availability, :custom,
                :owners_number, :price, :credit_discount,
                :insurance_discount, :tradein_discount, :max_discount,
                :currency, :description, :registry_year, :vin
  belongs_to :car
  belongs_to :dealer
  has_many :extra_options, dependent: :destroy
  has_many :images, dependent: :destroy
  has_one :reservation, dependent: :destroy

  validates :price, numericality: { only_integer: true }
  validates :currency, inclusion: { in: %w[rub] }
  validates :color, :availability, :owners_number,
            :registry_year, :vin, presence: true
  validates :custom, inclusion: { in: [true, false, 'true', 'false'] }
  validates :metallic, inclusion: { in: [true, false, 'true', 'false'] }

  scope :available, -> { left_joins(:reservation).where('reservations.id' => nil) }
end
