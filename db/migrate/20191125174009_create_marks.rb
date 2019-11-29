# frozen_string_literal: true

class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index(:marks, :name, unique: true)
  end
end
