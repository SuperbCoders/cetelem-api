# frozen_string_literal: true

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
      t.string :marks, array: true

      t.timestamps
    end
  end
end
