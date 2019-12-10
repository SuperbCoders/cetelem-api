# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :country, :postcode, :region, :city, :street, :building, :location
end
