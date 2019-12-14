# frozen_string_literal: true

class DealerGroupSerializer < ActiveModel::Serializer
  attributes *DealerGroup.column_names
end
