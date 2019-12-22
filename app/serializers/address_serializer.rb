# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :country, :postcode, :region, :region_id, :city, :city_id, :street, :building, :location
end
