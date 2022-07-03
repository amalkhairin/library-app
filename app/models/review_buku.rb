class ReviewBuku < ApplicationRecord
    belongs_to :user
    belongs_to :buku
    validates :ulasan, presence: true
    validates :rating, presence: true
end
