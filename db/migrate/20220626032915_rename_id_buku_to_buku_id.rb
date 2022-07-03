# frozen_string_literal: true

class RenameIdBukuToBukuId < ActiveRecord::Migration[7.0]
  def change
    rename_column :peminjaman_bukus, :id_buku, :buku_id
  end
end
