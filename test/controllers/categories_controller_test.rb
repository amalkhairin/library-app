# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:category1)

    @user = User.create(
                name: 'Gifar', 
                email: 'halo@example.com', 
                username: 'gifaraja', 
                telephone: '0812345678910',
                password: 'admin1', 
                role_id: roles(:admin).id
            )

    @user2 = User.create(
              name: 'Gifar Dua', 
              email: 'halo2@example.com', 
              username: 'gifaraja2',
              telephone: '0812345678910', 
              password: 'admin1', 
              role_id: roles(:visitor).id
          )

    @admin_token = sign_in_as(@user)
    @user_token = sign_in_as(@user2)
  end

  test 'should list all categories' do
    get categories_url, as: :json
    assert_response :success
  end

  test 'create category if admin' do
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: 'IPA' } }, 
                           headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :created
  end

  test 'should not create category if not admin' do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: 'Math' } }, 
                           headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_response :success
  end

  test 'should show a spesific category' do
    get category_url(@category), as: :json
    assert_response :success
  end

  test 'should update category if admin' do
    old_category = @category.name

    patch category_url(@category), params: { category: { name: 'Matematika' } },
                                   headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    assert_not_same(true, old_category != @category.name)
  end

  test 'should not update category if not admin' do
    old_category = @category.name

    patch category_url(@category), params: { category: { name: @category.name } },
                                   headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }

    assert_same(true, old_category == @category.name)
  end

  test 'should delete category if admin' do
    assert_difference('Category.count', -1) do
      delete category_url(@category), params: {}, 
                                      headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :no_content
  end

  test 'should not delete category if not admin' do
    assert_no_difference('Category.count') do
      delete category_url(@category), params: {}, 
                                      headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert(Category.all.include?(@category))
  end
end
