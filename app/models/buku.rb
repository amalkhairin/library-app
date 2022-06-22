# frozen_string_literal: true

class Buku < ApplicationRecord
  has_many :peminjaman_bukus
  validates :category_id, presence: true
  validates :barcode, presence: true
  validates :isbn, presence: true
  validates :judul, presence: true
  validates :penulis, presence: true
  validates :jumlah_buku, presence: true
  validates :is_available, presence: true
end
