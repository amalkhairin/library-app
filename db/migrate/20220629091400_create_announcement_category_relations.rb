class CreateAnnouncementCategoryRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :announcement_category_relations do |t|
      t.integer :announcement_category_id
      t.integer :announcement_id

      t.timestamps
    end
  end
end
