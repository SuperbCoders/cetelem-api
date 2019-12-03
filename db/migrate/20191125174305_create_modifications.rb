# frozen_string_literal: true

class CreateModifications < ActiveRecord::Migration[6.0]
  def change
    create_table :modifications do |t|
      t.string :name, null: false
      t.string :engine_type
      t.integer :engine_hp
      t.float :engine_volume
      t.string :body_type
      t.integer :doors_count
      t.string :drive
      t.string :gearbox
      t.string :years
      t.references :model, index: true, foreign_key: true, null: false

      t.timestamps
    end
    add_index(:modifications, [:name, :body_type, :doors_count, :engine_type, :engine_hp, :drive, :gearbox, :years], unique: true, name: "uniq_modification")
  end
end
