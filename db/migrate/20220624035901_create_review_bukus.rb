class CreateReviewBukus < ActiveRecord::Migration[7.0]
  def change
    create_table :review_bukus do |t|
      t.integer :id_user
      t.integer :id_buku
      t.integer :rating
      t.text :ulasan
      

      t.timestamps
    end
  end
end
