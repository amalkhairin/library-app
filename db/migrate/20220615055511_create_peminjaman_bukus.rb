# frozen_string_literal: true

class CreatePeminjamanBukus < ActiveRecord::Migration[7.0]
  def change
    create_table :peminjaman_bukus do |t|
      # t.integer :id_user
      t.integer :id_buku
      t.datetime :jadwal_pinjam
      t.datetime :jadwal_kembali
      t.string :status

      t.timestamps
    end
  end
end
