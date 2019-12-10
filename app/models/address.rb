# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :dealer

  validates :country, :postcode, :region, :city, :street, :building, presence: true
end
