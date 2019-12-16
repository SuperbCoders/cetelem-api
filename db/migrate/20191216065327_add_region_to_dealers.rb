class AddRegionToDealers < ActiveRecord::Migration[6.0]
  def change
    add_reference :dealers, :region, null: true, foreign_key: true
  end
end
