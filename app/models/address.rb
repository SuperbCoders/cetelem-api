# frozen_string_literal: true

class Address < ApplicationRecord
  attr_accessor :country, :postcode, :region, :distriсt, :area, :city, :locality,
                :building, :region_code, :location

  belongs_to :dealer

  validates :country, :postcode, :region, :city, :building, :region_code, presence: true
end
