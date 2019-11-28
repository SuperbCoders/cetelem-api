# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :wheel, limit: 5
      t.integer :year
      t.references :mark, index: true, foreign_key: true, null: false
      t.references :model, index: true, foreign_key: true, null: false
      t.references :modification, index: true, foreign_key: true, null: false
      t.references :complectation, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
