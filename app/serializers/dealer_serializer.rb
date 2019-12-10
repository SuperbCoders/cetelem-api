# frozen_string_literal: true

class DealerSerializer < ActiveModel::Serializer
  attributes *Dealer.column_names
  has_many :contact_infos
  has_one :address
end
