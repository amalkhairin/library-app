class RenameIdKategori < ActiveRecord::Migration[7.0]
  def change
    rename_column :bukus, :id_kategori, :id_category
  end
end
