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

  test "should show user with auth" do
    auth_token = sign_in_as(@user)
    get user_path(@user), params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{auth_token}" }
    assert_response :success
  end

  test "should create new user" do
    assert_difference("User.count", 1) do 
      post users_path, params: { user: { name: "Gifar Siapa", email: "halo1@example.com", username: "gifaraja2", telephone: "0812345672910", password: "admin1", role_id: 1 } }, as: :json 
    end
    assert_response :success
  end

  test "should delete user if user admin" do
    auth_token = sign_in_as(@user)

    assert_difference("User.count", -1) do 
      delete user_path(@user), params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{auth_token}" }
    end
    assert_response :success
  end

  test "should not delete user if not admin" do
    @role2 = Role.create(role: "visitor")
    @user2 = User.create(name: "Gifa", email: "halo2@example.com", username: "gifaraja2", telephone: "0812345678210", password: "admin1", role_id: 2)

    auth_token = sign_in_as(@user2)

    assert_no_difference("User.count", -1) do 
      delete user_path(@user), params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{auth_token}" }
    end
    assert_response :success
  end

  test "should update user if admin" do 
    auth_token = sign_in_as(@user)
    @role2 = Role.create(role: "visitor")
    @user2 = User.create(name: "Gifa", email: "halo2@example.com", username: "gifaraja2", telephone: "0812345678210", password: "admin1", role_id: 2)

    patch user_path(@user2), params: {user: {username: "gifaraja3", password: "admin1"} }, headers: {HTTP_AUTHORIZATION: "JWT #{auth_token}"}
    
    assert_response :success
  end

  test "should not update user if not admin" do 
    @role2 = Role.create(role: "visitor")
    @user2 = User.create(name: "Gifa", email: "halo2@example.com", username: "gifaraja2", telephone: "0812345678210", password: "admin1", role_id: 2)

    auth_token = sign_in_as(@user2)

    patch user_path(@user), params: {user: {username: "gifaraja3", password: "admin1"} }, headers: {HTTP_AUTHORIZATION: "JWT #{auth_token}"}
    
    assert_response :success 
    puts @response.body
  end
end
