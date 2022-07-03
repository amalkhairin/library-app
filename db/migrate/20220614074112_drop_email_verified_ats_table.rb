# frozen_string_literal: true

class DropEmailVerifiedAtsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :email_verified_ats
  end
end
