require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = Role.create(role: "admin")
    @user = User.new(name: "Gifar Aja", email: "halo@example.com", username: "gifaraja", telephone: "0812345678910", password: "admin1")
    @user.role = @role
  end

  test "should render all user" do
    get users_path, as: :json
    assert_response :success
  end

  test "should show @user" do
    get users_path(@user), as: :json  
    assert_response :success
  end

  test "should update user" do
    @user.save
    patch user_path(@user), params: { user: { name: "Dadang", email: "halo@example.com", username: "gifaraja", telephone: "0812345678910", password: "admin1" }}, as: :json
    assert_response :success
  end

  # test "should get create" do
  #   get users_create_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get users_destroy_url
  #   assert_response :success
  # end
end
