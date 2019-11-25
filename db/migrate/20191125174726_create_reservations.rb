class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :phone, limit: 16
      t.string :email
      t.references :user, index: true, foreign_key: true, null: false\

      t.timestamps
    end
  end
end
