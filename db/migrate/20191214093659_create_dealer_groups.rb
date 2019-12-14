class CreateDealerGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :dealer_groups do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_reference :dealers, :dealer_group, null: true, foreign_key: true
  end
end
