class Announcement < ApplicationRecord
  validates :title, presence: true
end
