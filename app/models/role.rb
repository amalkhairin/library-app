class Role < ApplicationRecord
  has_many :users
  validates :role, presence: true, inclusion: {in: %w(admin visitor )}
end