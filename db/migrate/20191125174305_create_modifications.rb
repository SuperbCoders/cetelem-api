# frozen_string_literal: true

class CreateModifications < ActiveRecord::Migration[6.0]
  def change
    create_table :modifications do |t|
      t.string :name, null: false
      t.string :engine_type
      t.string :engine_power
      t.string :body_type
      t.string :drive
      t.string :gearbox
      t.string :years
      t.references :model, index: true, foreign_key: true, null: false

      t.timestamps
    end
    add_index(:modifications, [:name, :body_type, :engine_type, :engine_power, :drive, :gearbox,:years], unique: true, name: "uniq_modification")
  end
end
