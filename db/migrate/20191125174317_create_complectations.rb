# frozen_string_literal: true

class CreateComplectations < ActiveRecord::Migration[6.0]
  def change
    create_table :complectations do |t|
      t.string :name, null: false
      t.references :model, index: true, foreign_key: true, null: false

      t.timestamps
    end

    add_index(:complectations, %i[name model_id], unique: true)
  end
end
