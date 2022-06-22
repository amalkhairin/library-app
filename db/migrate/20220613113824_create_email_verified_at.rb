# frozen_string_literal: true

class CreateEmailVerifiedAt < ActiveRecord::Migration[7.0]
  def change
    create_table :email_verified_ats do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
