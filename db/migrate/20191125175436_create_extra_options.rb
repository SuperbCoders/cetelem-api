# frozen_string_literal: true

class CreateExtraOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :extra_options do |t|
      t.string :name
      t.references :dealer_car, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
