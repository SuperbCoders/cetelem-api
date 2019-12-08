# frozen_string_literal: true

class DealerCarSerializer < ActiveModel::Serializer
  attributes :id, :price, :mark, :model, :modification,
             :created_at, :updated_at

  has_many :images, serializer: ImageSerializer

  def mark
    object.car.mark.name
  end

  def model
    object.car.model.name
  end

  def modification
    object.car.modification.name
  end
end
