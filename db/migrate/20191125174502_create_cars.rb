# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.references :mark, index: true, foreign_key: true, null: false
      t.references :model, index: true, foreign_key: true, null: false
      t.references :modification, index: true, foreign_key: true, null: false
      t.references :complectation, index: true, foreign_key: true, null: true

      t.timestamps
    end

    add_index(:cars, %i[mark_id model_id modification_id complectation_id], unique: true,  name: 'uniq_car')
  end
end
