# frozen_string_literal: true

require 'test_helper'

class PeminjamanBukusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role1 = Role.create(role: 'admin')
    @role2 = Role.create(role: 'visitor')

    @user = User.create(name: 'Cristiano Ronaldo', username: 'ronaldo', email: 'ronaldo@gmail.com',
                        telephone: '0888888888', password: 'admin1', role_id: 2)
    @admin = User.create(name: 'Cristiano Ronaldinho', username: 'ronaldinho', email: 'ronaldinho@gmail.com',
                         telephone: '0888888889', password: 'admin1', role_id: 1)

    @book1 = bukus(:book1)
    @book2 = bukus(:book2)

    @user_token = sign_in_as(@user)
    @admin_token = sign_in_as(@admin)
  end

  test 'user can borrow the book if less than two' do
    assert_difference('@user.peminjaman_bukus.count', 1) do
      post "/buku/#{@book1.id}/peminjaman_buku", params: { buku_id: @book1.id },
                                                 headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_response :success
  end

  test 'user can not borrow book if book not available' do
    assert_no_difference('@user.peminjaman_bukus.count') do
      post "/buku/#{@book2.id}/peminjaman_buku", params: { buku_id: @book2.id },
                                                 headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_response :success
  end

  test 'book will be reduced by one if it is successfully borrowed' do
    assert_difference('@book1.jumlah_buku', 0) do
      post "/buku/#{@book1.id}/peminjaman_buku", params: { buku_id: @book1.id },
                                                 headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_response :success
  end

  test 'only admin can delete book loan transaction' do
    @loan = PeminjamanBuku.create(user_id: @user.id, buku_id: @book1.id, jadwal_pinjam: Time.now,
                                  jadwal_kembali: 7.days.from_now)

    assert_difference('PeminjamanBuku.count', -1) do
      delete  "/user/#{@user.id}/peminjaman_buku/#{@loan.id}",
                                                  params: {}, 
                                                  headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :success
  end

  test 'visitor can not delete book loan transaction' do
    @loan = PeminjamanBuku.create(user_id: @user.id, buku_id: @book1.id, jadwal_pinjam: Time.now,
                                  jadwal_kembali: 7.days.from_now)

    assert_no_difference('PeminjamanBuku.count') do
      delete  "/user/#{@user.id}/peminjaman_buku/#{@loan.id}", params: {},
                                                               headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_response :success
  end

  test 'the number of books will increase after returning books' do
    assert_difference('@user.peminjaman_bukus.count', 1) do
      post "/buku/#{@book1.id}/peminjaman_buku", params: { buku_id: @book1.id },
                                                 headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_no_difference('@book1.jumlah_buku') do
      delete "/user/#{@user.id}/peminjaman_buku/#{PeminjamanBuku.last.id}", params: {},
                                                                            headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :success
  end
end
