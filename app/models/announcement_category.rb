# frozen_string_literal: true

class AnnouncementCategory < ApplicationRecord
  has_many :announcement_category_relations
  has_many :announcements, through: :announcement_category_relations
  validates :category_name, presence: true, length: { maximum: 25 }, uniqueness: { case_sensitive: false }
end
