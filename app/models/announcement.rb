class Announcement < ApplicationRecord
  has_many :announcement_category_relations
  has_many :announcement_categories, through: :announcement_category_relations
  validates :title, presence: true, length: {maximum: 100}
end
