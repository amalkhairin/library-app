class ChangeColumnIsAvailableInBukus < ActiveRecord::Migration[7.0]
  def change
    change_column :bukus, :is_available, :boolean
  end
end
