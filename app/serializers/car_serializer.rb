class CarSerializer < ActiveModel::Serializer
  attributes :id, :mark, :model, :modification, :body_type, :years, :complectation, :drive,
              :doors_count, :engine_type, :engine_hp, :gearbox, :engine_volume,
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

  def drive
    object.modification.drive
  end

  def engine_type
    object.modification.engine_type
  end

  def engine_hp
    object.modification.engine_hp
  end

  def engine_volume
    object.modification.engine_volume
  end

  def gearbox
    object.modification.gearbox
  end

  def doors_count
    object.modification.doors_count
  end

  def years
    object.modification.years
  end

  def complectation
    object.complectation&.name
  end
end
