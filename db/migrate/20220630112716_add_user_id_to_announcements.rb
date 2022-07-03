# frozen_string_literal: true

class AddUserIdToAnnouncements < ActiveRecord::Migration[7.0]
  def change
    add_column :announcements, :user_id, :integer
  end
end
