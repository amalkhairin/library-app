require "test_helper"

class BukuTest < ActiveSupport::TestCase
  test "valid_buku" do
    assert Buku.new(
      id_kategori: 1,
      barcode: "73891hiuha8hiojdka9",
      isbn: "8872671-3",
      judul: "Kalkulus 2",
      deskripsi: "Buku materi pelajaran Kalkulus 2",
      penulis: "Amal",
      penerbit: "Erlangga",
      gambar_buku: "gambar.jpg",
      file_buku: "buku.pdf",
      bahasa: "ID",
      edisi: "31",
      tahun_terbit: 2023,
      subject: "-",
      lokasi: "Bandung",
      jumlah_buku: 2,
      isAvailable: true
    ).valid?
  end
end
