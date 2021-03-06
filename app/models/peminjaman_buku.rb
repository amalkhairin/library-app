# frozen_string_literal: true

class PeminjamanBuku < ApplicationRecord
  belongs_to :user
  belongs_to :buku
  validates :status, length: { maximum: 20 }
end
