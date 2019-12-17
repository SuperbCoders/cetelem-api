# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :role, :dealer_id, :updated_at, :created_at
end
