# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :country, null: false
      t.string :postcode, limit: 20, null: false
      t.string :region, null: false
      t.string :city, null: false
      t.string :street
      t.string :building, limit: 10
      t.point :location

      t.references :dealer, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
