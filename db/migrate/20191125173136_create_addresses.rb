class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :postcode, limit: 20
      t.string :region
      t.string :distriсt
      t.string :area
      t.string :city
      t.string :locality
      t.string :building, limit: 10
      t.integer :region_codde
      t.point :location

      t.timestamps
    end
  end
end
