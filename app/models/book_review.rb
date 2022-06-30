class BookReview < ApplicationRecord
  validates :rating, presence: true, numericality: {only_integer: true, less_than: 6}
end
