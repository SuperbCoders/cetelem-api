class CreateComplectations < ActiveRecord::Migration[6.0]
  def change
    create_table :complectations do |t|
      t.string :name
      t.references :model, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
