# frozen_string_literal: true

class AddUserIdToPeminjamanBukus < ActiveRecord::Migration[7.0]
  def change
    add_column :peminjaman_bukus, :user_id, :integer
  end
end
