# frozen_string_literal: true

require 'test_helper'

class BukuControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @buku = bukus(:book1)
    @role = Role.create(role: 'admin')
    @user = User.create(name: 'Gifar', email: 'halo@example.com', username: 'gifaraja', telephone: '0812345678910',
                        password: 'admin1', role_id: 1)
    @role = Role.create(role: 'visitor')                 
    @user2 = User.create(name: 'Gifar Kedua', email: 'halo2@example.com', username: 'gifaraja2', 
                        telephone: '0812345678911',password: 'admin1', role_id: 2)
  end

  test "should list all books" do 
    get '/buku', as: :json
    assert_response :success
  end

  test 'should show specific book' do 
    get buku_path(@buku), as: :json
    assert_response :success
  end

  test 'should create a new book if admin' do 
    auth_token = sign_in_as(@user)

    assert_difference('Buku.count', 1) do 
      post '/buku',
           params: { buku: { category_id: 1, barcode: '142352525', isbn: '25252525-23', judul: 'Hai Dunia', penulis: 'Fulan', jumlah_buku: 1, is_available: true } }, headers: {HTTP_AUTHORIZATION: "JWT #{auth_token}"}
    end

    assert_response :success
    puts @response.body
  end

  test 'should not create a new book if not admin' do 
    auth_token = sign_in_as(@user2)

    assert_no_difference('Buku.count') do 
      post '/buku',
           params: { buku: { category_id: 1, barcode: '142352525', isbn: '25252525-23', judul: 'Hai Dunia', penulis: 'Fulan', jumlah_buku: 1, is_available: true } }, headers: {HTTP_AUTHORIZATION: "JWT #{auth_token}"}
    end

    assert_response :success
     puts @response.body
  end

  test 'should delete book if admin' do 
    auth_token = sign_in_as(@user)

    assert_difference('Buku.count', -1) do 
      delete buku_path(@buku), params: {}, headers: {HTTP_AUTHORIZATION: "JWT #{auth_token}"}
    end

    assert_response :success
    puts @response.body
  end

  test 'should not delete book if not admin' do 
    auth_token = sign_in_as(@user2)

    assert_no_difference('Buku.count', -1) do 
      delete buku_path(@buku), params: {}, headers: {HTTP_AUTHORIZATION: "JWT #{auth_token}"}
    end

    assert_response :success
    puts @response.body
  end
end
