require "test_helper"

class AnnouncementCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcement_category = announcement_categories(:category1)
  end

  test "should get all categories" do
    get announcement_categories_path, as: :json
    assert_response :success
  end 
end
