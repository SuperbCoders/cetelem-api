class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :name, null: false
      t.integer :postcodes, array: true
      t.integer :code

      t.timestamps
    end
  end
end
