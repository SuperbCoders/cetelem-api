# frozen_string_literal: true

class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :phone, :email, :name, :client_id, :dealer_car_id, :vin,
             :mark, :model, :dealer, :updated_at, :created_at, :dealer_group

  def vin
    object.dealer_car.vin
  end

  def mark
    object.dealer_car.car.mark.name
  end

  def model
    object.dealer_car.car.model.name
  end

  def dealer
    object.dealer_car.dealer&.name
  end

  def dealer_group
    object.dealer_car.dealer_group&.name
  end
end
