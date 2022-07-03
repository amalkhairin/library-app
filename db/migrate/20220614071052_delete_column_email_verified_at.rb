# frozen_string_literal: true

class DeleteColumnEmailVerifiedAt < ActiveRecord::Migration[7.0]
  def change
    remove_column :email_verified_ats, :user_id, :integer
  end
end
