# frozen_string_literal: true

class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :name, null: false
      t.references :mark, index: true, foreign_key: true, null: false

      t.timestamps
    end
    add_index(:models, %i[name mark_id], unique: true)
  end
end
