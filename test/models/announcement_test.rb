require "test_helper"

class AnnouncementTest < ActiveSupport::TestCase
  setup do 
    @announcement = announcements(:announcement1)
  end

  test 'announcement should be valid' do
    assert @announcement.valid?
  end

  test 'title announcement should be present' do
    @announcement.title = ''
    assert_not @announcement.valid?
  end

  test 'title announcement should not be too long' do
    @announcement.title = 'a' * 101
    assert_not @announcement.valid?
  end
end
