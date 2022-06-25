require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:category1)
    role = Role.create(role: 'admin')
    @user = User.create(name: 'Gifar', email: 'halo@example.com', username: 'gifaraja', telephone: '0812345678910',
                        password: 'admin1', role_id: 1)
  end

  test "should list all categories" do
    get categories_url, as: :json
    assert_response :success
  end

  test "create category if admin" do
    auth_token = sign_in_as(@user)

    assert_difference("Category.count") do
      post categories_url, params: { category: { name: @category.name } }, headers: {HTTP_AUTHORIZATION: "JWT #{auth_token}"}
    end

    assert_response :created
  end

  # test "should show category" do
  #   get category_url(@category), as: :json
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: { name: @category.name } }, as: :json
  #   assert_response :success
  # end

  # test "should destroy category" do
  #   assert_difference("Category.count", -1) do
  #     delete category_url(@category), as: :json
  #   end

  #   assert_response :no_content
  # end
end
