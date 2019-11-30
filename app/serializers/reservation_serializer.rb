# frozen_string_literal: true

class ReservationSerializer < ActiveModel::Serializer
  attributes *Reservation.column_names
end
