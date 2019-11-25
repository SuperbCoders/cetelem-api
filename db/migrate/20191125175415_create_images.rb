class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url
      t.references :dealer_car, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
