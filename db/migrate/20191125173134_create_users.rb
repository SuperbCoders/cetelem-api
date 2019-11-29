# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password_digest
      t.integer :role, null: false
      t.timestamps
    end

    add_index :users, :login, unique: true
  end
end
