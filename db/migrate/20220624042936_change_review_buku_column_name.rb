class ChangeReviewBukuColumnName < ActiveRecord::Migration[7.0]
  def up
    rename_column :review_bukus, :id_buku, :buku_id
    rename_column :review_bukus, :id_user, :user_id
  end

  def down
    rename_column :review_bukus, :buku_id, :id_buku
    rename_column :review_bukus, :user_id, :id_user

  end
end
