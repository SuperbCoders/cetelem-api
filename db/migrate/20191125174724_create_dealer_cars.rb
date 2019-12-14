# frozen_string_literal: true

class CreateDealerCars < ActiveRecord::Migration[6.0]
  def change
    create_table :dealer_cars do |t|
      t.string :color
      t.string :wheel
      t.string :engine_type
      t.boolean :metallic
      t.string :availability
      t.boolean :custom
      t.boolean :new, default: true
      t.string :owners_number
      t.integer :price
      t.integer :credit_discount
      t.integer :insurance_discount
      t.integer :tradein_discount
      t.integer :max_discount
      t.string :currency, limit: 10
      t.text :description
      t.integer :year
      t.integer :registry_year
      t.string :vin, limit: 30
      t.integer :run
      t.string :state, limit: 20

      t.references :car, index: true, foreign_key: true, null: false
      t.references :owner, polymorphic: true

      t.timestamps
    end

    create_table :dealer_car_extra_options do |t|
      t.references :extra_option, index: true, foreign_key: true, null: true
      t.references :dealer_car, index: true, foreign_key: true, null: true
      t.timestamps
    end
  end
end
