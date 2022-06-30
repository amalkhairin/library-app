class BookReview < ApplicationRecord
  validates :rating, presence: true
end
