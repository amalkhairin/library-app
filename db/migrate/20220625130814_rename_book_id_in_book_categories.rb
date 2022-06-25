class RenameBookIdInBookCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :book_categories, :book_id, :buku_id
  end
end
