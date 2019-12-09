class AddDealerIdToUser < ActiveRecord::Migration[6.0]
  def change
     add_reference :users, :dealer, index: true, foreign_key: true, null: true
  end
end
