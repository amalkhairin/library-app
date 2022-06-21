require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = Role.create(role: "admin")
    @user = User.create(name: "Gifar", email: "halo@example.com", username: "gifaraja", telephone: "0812345678910", password: "admin1", role_id: 1)
  end

  test "should render all user with auth" do
    auth_token = sign_in_as(@user)
    get users_path, params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{auth_token}" }
    assert_response :success
  end

  # test "should show user" do
  #   get user_path(@user), as: :json 
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch user_path(@user), params: { user: { name: "Dadang", email: "halo@example.com", username: "gifaraja", telephone: "0812345678910", password: "admin1" } }, as: :json
  #   assert_response :success
  # end

  # test "should create new user" do
  #   assert_difference("User.count", 1) do 
  #     post users_path, params: { user: { name: "Gifar Siapa", email: "halo1@example.com", username: "gifaraja2", telephone: "0812345672910", password: "admin1", role_id: 1 } }, as: :json 
  #   end
  #   assert_response :success
  # end

  # test "should delete user" do
  #   assert_difference("User.count", -1) do 
  #     delete user_path(@user), as: :json
  #   end
  #   assert_response :no_content
  # end
end
