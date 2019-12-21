class AddDealerIdToReservation < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :dealer, null: true, foreign_key: true
  end
end
