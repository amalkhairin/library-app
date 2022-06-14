require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(name: "Gifar Aja", email: "halo@example.com", username: "gifaraja", telephone: "0812345678910", password: "admin1")
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get show" do
    get users_path(@user)
    assert_response :success
  end

  # test "should get edit" do
  #   get users_edit_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get users_update_url
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
