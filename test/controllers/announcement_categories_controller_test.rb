require "test_helper"

class AnnouncementCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcement_category = announcement_categories(:category1)

    @role1 = Role.create(role: 'admin')
    @role2 = Role.create(role: 'visitor')

    @user = User.create(name: 'Gifar', email: 'halo@example.com', username: 'gifaraja', telephone: '0812345678910',
                        password: 'admin1', role_id: 1)
    @user2 = User.create(name: 'Gifar Kedua', email: 'halo2@example.com', username: 'gifaraja2',
                         telephone: '0812345678911', password: 'admin1', role_id: 2)

    @admin_token = sign_in_as(@user)
    @user_token = sign_in_as(@user2)
  end

  test "should get all categories" do
    get announcement_categories_path, as: :json
    assert_response :success
  end 

  test 'should create announcement category if admin' do 
    assert_difference('AnnouncementCategory.count', 1) do
      post announcement_categories_path,
           params: { category_name: 'Libur Lagi' } , headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :success
  end
end
