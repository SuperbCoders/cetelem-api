# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes: *Address.column_names
end
