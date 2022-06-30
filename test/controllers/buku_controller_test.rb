# frozen_string_literal: true

require 'test_helper'

class BukuControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buku = bukus(:book1)

    @role1 = Role.create(role: 'admin')
    @role2 = Role.create(role: 'visitor')

    @user = User.create(name: 'Gifar', email: 'halo@example.com', username: 'gifaraja', telephone: '0812345678910',
                        password: 'admin1', role_id: 1)
    @user2 = User.create(name: 'Gifar Kedua', email: 'halo2@example.com', username: 'gifaraja2',
                         telephone: '0812345678911', password: 'admin1', role_id: 2)

    @admin_token = sign_in_as(@user)
    @user_token = sign_in_as(@user2)
  end

  test 'should list all books' do
    get '/buku', as: :json
    assert_response :success
  end

  test 'should show specific book' do
    get buku_path(@buku), as: :json
    assert_response :success
  end

  test 'should create a new book if admin' do
    assert_difference('Buku.count', 1) do
      post '/buku',
           params: { buku: { barcode: '142352525', isbn: '25252525-23', judul: 'Hai Dunia', penulis: 'Fulan', jumlah_buku: 1, deskripsi: 'Lorem Ipsum', penerbit: 'Generasi Gigih' } }, headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :success
  end

  test 'should not create a new book if not admin' do
    assert_no_difference('Buku.count') do
      post '/buku',
           params: { buku: { barcode: '142352525', isbn: '25252525-23', judul: 'Hai Dunia', penulis: 'Fulan', jumlah_buku: 1} }, headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_response :success
  end

  test 'should delete book if admin' do
    assert_difference('Buku.count', -1) do
      delete buku_path(@buku), params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :success
  end

  test 'should not delete book if not admin' do
    assert_no_difference('Buku.count', -1) do
      delete buku_path(@buku), params: {}, headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_response :success
  end

  test 'should update specific book if admin' do
    old_name = @buku.judul

    patch buku_path(@buku), params: { buku: { judul: 'Belajar C++' } },
                            headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }

    assert_not_same(true, old_name != @buku.judul)
  end

  test 'should not update specific book if not admin' do
    old_name = @buku.judul

    patch buku_path(@buku), params: { buku: { judul: 'Belajar C++' } },
                            headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }

    assert_same(true, old_name == @buku.judul)
  end

  test 'should update book category if admin' do
    category1 = Category.create(name: 'Bahasa')
    category2 = Category.create(name: 'IPA')

    patch buku_path(@buku), params: { buku: { category_ids: [category1.id, category2.id] } },
                            headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }

    assert_includes(@buku.categories, category1)
  end
end
