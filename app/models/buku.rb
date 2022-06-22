# frozen_string_literal: true

class Buku < ApplicationRecord
  has_many :peminjaman_bukus
  validates :category_id, presence: true
  validates :barcode, presence: true
  # validates :isbn, presence: true
  # validates :judul, presence: true
  # validates :deskripsi, presence: true
  # validates :penulis, presence: true
  # validates :penerbit, presence: true
  # validates :gambar_buku, presence: true
  # validates :file_buku, presence: true
  # validates :bahasa, presence: true
  # validates :edisi, presence: true
  # validates :tahun_terbit, presence: true
  # validates :subject, presence: true
  # validates :lokasi, presence: true
  # validates :jumlah_buku, presence: true
  # validates :isAvailable, presence: true
end
