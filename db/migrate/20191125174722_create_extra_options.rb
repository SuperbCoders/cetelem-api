# frozen_string_literal: true

class CreateExtraOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :extra_options do |t|
      t.string :name, null: false
      t.string :type, null: false

      t.timestamps
    end
    add_index(:extra_options, :name, unique: true)
  end
end
