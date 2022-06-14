require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(name: "Gifar Aja", email: "halo@example.com", username: "gifaraja", telephone: "0812345678910", password: "admin1")
  end

  test "should render all user" do
    get users_path, as: :json
    assert_response :success
  end

  # test "should get show" do
  #   get users_path(user["id"])
  #   assert_response :success
  # end

  # test "should get update" do
  #   get users_update(@users)
  #   assert_response :success
  # end

  # test "should get new" do
  #   get users_new_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get users_create_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get users_destroy_url
  #   assert_response :success
  # end
end
