class CarSerializer < ActiveModel::Serializer
  attributes :id, :mark, :model, :modification, :body_type, :years, :complectation,
             :created_at, :updated_at

  def mark
    object.mark.name
  end

  def model
    object.model.name
  end

  def modification
    object.modification.name
  end

  def body_type
    object.modification.body_type
  end

  def years
    object.modification.years
  end

  def complectation
    object.complectation&.name
  end
end
