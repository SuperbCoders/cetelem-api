# frozen_string_literal: true

class DefaultFilterSerializer < ActiveModel::Serializer
  attributes :id, :title, :data, :created_at, :updated_at
end
