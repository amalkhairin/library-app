class AnnouncementCategory < ApplicationRecord
  validates :category_name, presence: true, length: {maximum: 25}
end
