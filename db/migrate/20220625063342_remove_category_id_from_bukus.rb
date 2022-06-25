class RemoveCategoryIdFromBukus < ActiveRecord::Migration[7.0]
  def change
    remove_column :bukus, :category_id
  end
end
