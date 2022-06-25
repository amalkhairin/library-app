# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = Role.create(role: 'admin')
    @role2 = Role.create(role: 'visitor')

    @user = User.create(name: 'Gifar', email: 'halo@example.com', username: 'gifaraja', telephone: '0812345678910',
                        password: 'admin1', role_id: 1)
                        
    @user2 = User.create(name: 'Gifa', email: 'halo2@example.com', username: 'gifaraja2',
                         telephone: '0812345678210',
                         password: 'admin1', role_id: 2)

    @admin_token = sign_in_as(@user)
    @user_token = sign_in_as(@user2)                    
  end

  test 'should render all user with auth' do
    get users_path, params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{ @admin_token}" }
    assert_response :success
  end

  test 'should show user with auth' do
    get user_path(@user), params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    assert_response :success
  end

  test 'should create new user' do
    assert_difference('User.count', 1) do
      post users_path,
           params: { user: { name: 'Gifar Ganteng', email: 'halo1@example.com', username: 'gifaraja22', telephone: '0812345672910', password: 'admin1', role_id: 1 } }, as: :json
    end
    assert_response :success
  end

  test 'should delete user if user admin' do
    assert_difference('User.count', -1) do
      delete user_path(@user), params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end
    assert_response :success
  end

  test 'should not delete user if not admin' do
    assert_no_difference('User.count', -1) do
      delete user_path(@user), params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end
    assert_response :success
  end

  test 'should update user if admin' do
    patch user_path(@user2), params: { user: { username: 'gifaraja3', password: 'admin1' } },
                             headers: { HTTP_AUTHORIZATION: "JWT #{ @admin_token}" }

    assert_response :success
  end

  test 'should not update user if not admin' do
    patch user_path(@user), params: { user: { username: 'gifaraja3', password: 'admin1' } },
                            headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }

    assert_response :success
  end

  test 'should update user if same user' do
    patch user_path(@user), params: { user: { username: 'gifaraja3', password: 'admin1', role_id: 1 } },
                            headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }

    assert_response :success
  end
end
