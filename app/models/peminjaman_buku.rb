class PeminjamanBuku < ApplicationRecord
    belongs_to :user
    belongs_to :buku
    validates :status, length: {maximum: 10}
end
