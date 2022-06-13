class Role < ApplicationRecord
  enum :role, {admin: 0, visitor: 1}
  validates :role, presence: true
end