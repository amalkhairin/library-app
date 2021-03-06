# frozen_string_literal: true

class Buku < ApplicationRecord
  has_many :peminjaman_bukus
  has_many :users, through: :peminjaman_bukus

  has_many :book_categories
  has_many :categories, through: :book_categories

  has_many :book_reviews
  has_many :users, through: :book_reviews

  validates :deskripsi, presence: true
  validates :penerbit, presence: true
  validates :barcode, presence: true
  validates :isbn, presence: true
  validates :judul, presence: true
  validates :penulis, presence: true
  validates :jumlah_buku, presence: true, numericality: { only_integer: true }

  def self.search(pattern = nil)
    if pattern.blank?
      all
    else
      where('judul LIKE ?', "%#{pattern[:title].downcase}%")
    end
  end
end
