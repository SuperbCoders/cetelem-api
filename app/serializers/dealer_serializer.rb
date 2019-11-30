# frozen_string_literal: true

class DealerSerializer < ActiveModel::Serializer
  attributes *Dealer.column_names
end
