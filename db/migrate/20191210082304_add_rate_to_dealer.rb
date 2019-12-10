class AddRateToDealer < ActiveRecord::Migration[6.0]
  def change
     add_column :dealers, :rate, :integer, limit: 1
  end
end
