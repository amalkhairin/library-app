# frozen_string_literal: true

require 'test_helper'

class PeminjamanBukusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role1 = Role.create(role: "admin")
    @role2 = Role.create(role: "visitor")

    @user = User.create(name: "Cristiano Ronaldo", username: 'ronaldo', email: 'ronaldo@gmail.com', telephone: '0888888888', password: 'admin1', role_id: 2)
    @book1 = bukus(:book1)
    @book2 = bukus(:book2)
  
    @user_token = sign_in_as(@user)
  end

  test 'user can borrow the book if less than two' do
    assert_difference('@user.peminjaman_bukus.count', 1) do 
      post "/buku/#{@book1.id}/peminjaman_bukus", params: {buku_id: @book1.id}, headers: {HTTP_AUTHORIZATION: "JWT #{@user_token}"}
    end

    assert_response :success
  end

  test 'user can not borrow book if book not available' do
    assert_no_difference('@user.peminjaman_bukus.count') do 
      post "/buku/#{@book2.id}/peminjaman_bukus", params: {buku_id: @book2.id}, headers: {HTTP_AUTHORIZATION: "JWT #{@user_token}"}
    end

    assert_response :success
  end
end
