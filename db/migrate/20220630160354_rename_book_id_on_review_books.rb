class RenameBookIdOnReviewBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :book_reviews, :book_id, :buku_id
  end
end
