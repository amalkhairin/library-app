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

  test 'announcement can have many categories' do
    category1 = announcement_categories(:category1)
    category2 = announcement_categories(:category2)
    @announcement.announcement_category_ids = [category1.id, category2.id]

    assert_includes(@announcement.announcement_categories, category1)
    assert_includes(@announcement.announcement_categories, category2)
  end

end
