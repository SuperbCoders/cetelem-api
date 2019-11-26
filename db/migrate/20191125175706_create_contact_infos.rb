# frozen_string_literal: true

class CreateContactInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_infos do |t|
      t.string :value
      t.string :value_type, limit: 20

      t.references :dealer, index: true, foreign_key: true, null: true
      t.references :user, index: true, foreign_key: true, null: true

      t.timestamps
    end
  end
end
