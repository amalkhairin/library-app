# frozen_string_literal: true

class Category < ApplicationRecord
  # has_many :book_categories
  # has_many :bukus, through: :book_categories

  validates :name, presence: true, length: { maximum: 20 }
end
