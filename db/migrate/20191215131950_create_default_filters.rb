class CreateDefaultFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :default_filters do |t|
      t.string :title, null: false
      t.json :data

      t.timestamps
    end
  end
end
