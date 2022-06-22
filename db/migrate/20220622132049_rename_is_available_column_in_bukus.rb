class RenameIsAvailableColumnInBukus < ActiveRecord::Migration[7.0]
  def change
    rename_column :bukus, :isAvailable, :is_available
  end
end
