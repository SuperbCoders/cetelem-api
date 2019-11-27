# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :auth_token
      t.string :role
      t.timestamps
    end
    add_index :users, :auth_token, unique: true
  end
end
