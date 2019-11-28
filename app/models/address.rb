# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :dealer

  validates :country, :postcode, :region, :city, :building, :region_code, presence: true
end
