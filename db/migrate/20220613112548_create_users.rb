# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :role_id
      t.string :profile
      t.string :name
      t.string :email
      t.string :username
      t.string :password
      t.string :telephone
      t.datetime :birthday
      t.string :gender
      t.string :address
      t.boolean :is_active

      t.timestamps
    end
  end
end
