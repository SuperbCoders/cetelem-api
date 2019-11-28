# frozen_string_literal: true

class CreateModifications < ActiveRecord::Migration[6.0]
  def change
    create_table :modifications do |t|
      t.string :name
      t.string :engine_type
      t.string :body_type
      t.string :drive
      t.string :gearbox
      t.string :years
      t.references :model, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
