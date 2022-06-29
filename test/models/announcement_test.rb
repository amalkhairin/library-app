require "test_helper"

class AnnouncementTest < ActiveSupport::TestCase
  setup do 
    @announcement = announcements(:announcement1)
  end

  test 'announcement should be valid' do
    assert @announcement.valid?
  end
end
