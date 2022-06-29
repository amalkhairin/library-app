class AnnouncementCategoryRelation < ApplicationRecord
  belongs_to :announcement
  belongs_to :announcement_category
end
