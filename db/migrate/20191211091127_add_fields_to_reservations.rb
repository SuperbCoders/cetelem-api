# frozen_string_literal: true

class AddFieldsToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column(:reservations, :name, :string)
    add_column(:reservations, :client_id, :integer)
  end
end
