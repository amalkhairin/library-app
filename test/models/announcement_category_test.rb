require "test_helper"

class AnnouncementCategoryTest < ActiveSupport::TestCase
  setup do 
    @announcement_category = announcement_categories(:category1)
  end

  test 'announcement category should be valid' do 
    assert @announcement_category.valid?
  end
end
