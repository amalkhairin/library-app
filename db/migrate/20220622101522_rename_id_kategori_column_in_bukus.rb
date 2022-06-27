# frozen_string_literal: true

class RenameIdKategoriColumnInBukus < ActiveRecord::Migration[7.0]
  def change
    rename_column :bukus, :id_kategori, :category_id
  end
end
