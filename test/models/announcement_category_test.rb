require "test_helper"

class AnnouncementCategoryTest < ActiveSupport::TestCase
  setup do 
    @announcement_category = announcement_categories(:category1)
  end

  test 'announcement category should be valid' do 
    assert @announcement_category.valid?
  end

  test 'announcement category name should be present' do
    @announcement_category.category_name = ''
    assert_not @announcement_category.valid?
  end

  test 'announcement category name should not be too long' do
    @announcement_category.category_name = 'a' * 26
    assert_not @announcement_category.valid?
  end

  test 'announcement category can have many articles' do
    announcement1 = announcements(:announcement1)
    announcement2 = announcements(:announcement2)

    @announcement_category.announcement_ids = [announcement1.id, announcement2.id]

    assert_includes(@announcement_category.announcements, announcement1)
    assert_includes(@announcement_category.announcements, announcement2)
  end
end
