class AddNewFieldsToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column(:addresses, :region_id, :string)
    add_column(:addresses, :city_id, :string)

    add_index :addresses, :region_id
    add_index :addresses, :city_id
  end
end
