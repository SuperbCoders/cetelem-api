# frozen_string_literal: true

class DealerCar < ApplicationRecord
  attr_accessor :color, :metallic, :availability, :custom,
                :owners_number, :credit_discount,
                :insurance_discount, :tradein_discount, :max_discount,
                :currency, :description, :registry_year, :vin
  belongs_to :car
  belongs_to :dealer
  has_many :extra_options, dependent: :destroy
  has_many :images, dependent: :destroy
  has_one :reservation, dependent: :destroy

  validates :currency, inclusion: { in: %w[rub] }
  validates :color, :metallic, :availability, :owners_number,
            :registry_year, :vin, presence: true
  validates :custom, inclusion: { in: [true, false] }
end
