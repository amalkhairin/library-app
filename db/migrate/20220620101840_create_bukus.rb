class CreateBukus < ActiveRecord::Migration[7.0]
  def change
    create_table :bukus do |t|
      t.string :id_kategori
      t.string :barcode
      t.string :isbn
      t.string :judul
      t.string :deskripsi
      t.string :penulis
      t.string :penerbit
      t.string :gambar_buku
      t.string :file_buku
      t.string :bahasa
      t.string :edisi
      t.string :tahun_terbit
      t.string :subject
      t.string :lokasi
      t.string :jumlah_buku
      t.string :isAvailable

      t.timestamps
    end
  end
end
