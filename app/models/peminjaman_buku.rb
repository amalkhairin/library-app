class PeminjamanBuku < ApplicationRecord
    belongs_to :user
    validates :status, length: {maximum: 10}
end
