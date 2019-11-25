class CreateDealerCars < ActiveRecord::Migration[6.0]
  def change
    create_table :dealer_cars do |t|
      t.string :color
      t.boolean :metallic
      t.string :availability
      t.boolean :custom
      t.integer :owners_number
      t.integer :credit_discount
      t.integer :insurance_discount
      t.integer :tradein_discount
      t.integer :max_discount
      t.string :currency, limit: 10
      t.text :description
      t.integer :registry_year
      t.string :vin, limit: 30

      t.references :car, index: true, foreign_key: true, null: false
      t.references :dealer, index: true, foreign_key: true, null: false
      t.references :reservation, index: true, foreign_key: true, null: true

      t.timestamps
    end
  end
end
