class CreateDealers < ActiveRecord::Migration[6.0]
  def change
    create_table :dealers do |t|
      t.string :code
      t.boolean :official_dealer
      t.string :legal_name
      t.string :trade_name
      t.string :distributor
      t.boolean :bonus
      t.text :bonus_description
      t.boolean :used_car_saling
      t.string :brands, array: true

      t.references :address, index: true, foreign_key: true, null: false
      t.references :working_hour, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
