# frozen_string_literal: true

class CreateDealerCars < ActiveRecord::Migration[6.0]
  def change
    create_table :dealer_cars do |t|
      t.string :color
      t.string :wheel
      t.string :color
      t.string :engine_type
      t.boolean :metallic
      t.string :availability
      t.boolean :custom
      t.string :owners_number
      t.integer :price
      t.integer :credit_discount
      t.integer :insurance_discount
      t.integer :tradein_discount
      t.integer :max_discount
      t.string :currency, limit: 10
      t.text :description
      t.integer :registry_year
      t.string :vin, limit: 30
      t.string :integer, limit: 30

      t.references :car, index: true, foreign_key: true, null: false
      t.references :dealer, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
