# frozen_string_literal: true

class Category < ApplicationRecord
  before_save {self.name = name.downcase}
  has_many :book_categories
  has_many :bukus, through: :book_categories

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: {case_sensitive: false}
end
