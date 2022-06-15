require "test_helper"

class PeminjamanBukusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peminjaman_buku = peminjaman_bukus(:one)
  end

  test "should get index" do
    get peminjaman_bukus_url, as: :json
    assert_response :success
  end

  test "should create peminjaman_buku" do
    assert_difference("PeminjamanBuku.count") do
      post peminjaman_bukus_url, params: { peminjaman_buku: { id_buku: @peminjaman_buku.id_buku, id_user: @peminjaman_buku.id_user, jadwal_kembali: @peminjaman_buku.jadwal_kembali, jadwal_pinjam: @peminjaman_buku.jadwal_pinjam, status: @peminjaman_buku.status } }, as: :json
    end

    assert_response :created
  end

  test "should show peminjaman_buku" do
    get peminjaman_buku_url(@peminjaman_buku), as: :json
    assert_response :success
  end

  test "should update peminjaman_buku" do
    patch peminjaman_buku_url(@peminjaman_buku), params: { peminjaman_buku: { id_buku: @peminjaman_buku.id_buku, id_user: @peminjaman_buku.id_user, jadwal_kembali: @peminjaman_buku.jadwal_kembali, jadwal_pinjam: @peminjaman_buku.jadwal_pinjam, status: @peminjaman_buku.status } }, as: :json
    assert_response :success
  end

  test "should destroy peminjaman_buku" do
    assert_difference("PeminjamanBuku.count", -1) do
      delete peminjaman_buku_url(@peminjaman_buku), as: :json
    end

    assert_response :no_content
  end
end
