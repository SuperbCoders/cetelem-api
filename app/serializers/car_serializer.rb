class CarSerializer < ActiveModel::Serializer
  attributes :id, :mark, :model, :modification, :complectation
  def mark
    object.mark.name
  end

  def model
    object.model.name
  end

  def modification
    object.modification.name
  end

  def complectation
    object.complectation&.name
  end
end
