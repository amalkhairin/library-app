class RenameCategoryId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bukus, :id_category, :category_id
  end
end
