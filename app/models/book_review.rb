class BookReview < ApplicationRecord
  validates :rating, presence: true, numericality: {only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
  validates :review, presence: true, length: {maximum: 100}
end
