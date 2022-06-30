class BookReview < ApplicationRecord
  validates :rating, presence: true, numericality: true
end
