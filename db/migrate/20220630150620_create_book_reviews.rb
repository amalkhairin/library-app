class CreateBookReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :book_reviews do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :rating
      t.string :review

      t.timestamps
    end
  end
end
