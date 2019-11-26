# frozen_string_literal: true

class Address < ApplicationRecord
  attr_accessor :country, :postcode, :region, :distriсt, :area, :city, :locality,
                  :building, :region_codde, :location
  belongs_to :dealer
end
