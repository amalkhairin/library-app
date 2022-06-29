class AnnouncementCategory < ApplicationRecord
  validates :category_name, presence: true 
end
