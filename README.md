# Library APP

Library app is an Library API. This API can help you built your own library without to think about your backend side. We've been develop backend side for you. You just need integrated your apps via API.

See [WIKI](https://github.com/amalkhairin/library-app/wiki#documentation-libary-app) for documentation.

# README

## Update push 26-Juni-2022

### 1. Menambahkan gem

Menambahkan gem rubocop ke dalam Gemfile, gunakan rubocop -A untuk menjalankan autocorrection ruby style guide [GitHub Pages](https://rubocop.org/).

### 2. Memperbaiki bug di CRUD Buku

**Column isAvailable telah **diganti** menjadi is_available dengan nilai awal integer menjadi boolean**.

- Menambahakan validasi kedalam model Buku (Lihat **app/model/buku.rb**).

- Membuat model test pada buku gunakan **rails test .\test\models\buku_test.rb** untuk menjalankan test.

- Membuat controller test pada buku gunakan **rails test .\test\controllers\buku_controller_test.rb** untuk menjalankan test.

### 3. Memperbaiki Bug di CRUD Category

- **Mengubah** relasi antara category dan buku menjadi N:N, dengan table sebagai berikut

  - Table Categories
  - Table Book_Categories sebagai perantara
  - Table Buku
    Lihat _schema.rb_ untuk melihat detail column pada masing-masing table.

- Menambahkan Controller test pada category gunakan **rails test .\test\controllers\categories_controller_test.rb** untuk menjalankan test.
- Menambahkan Model test pada category gunakan **rails test .\test\models\category_test.rb** untuk menjalankan test.

### 4.Membuat Fitur Search Book

Membuat fitur untuk melakukan pencarian buku sesuai judul

### 5. Refactor Code Agar Lebih Mudah Dibaca

Hanya menerapkan clean code pada project

## Update push 28-Juni-2022

### Fitur Peminjaman

- User dapat meminjam buku
- User tidak dapat meminjam buku jika peminjaman lebih dari dua buku
- User tidak dapat meminjam buku jika buku tidak tersedia
- User tidak bisa menghapus tranksaksi peminjaman
- Admin dapat menghapus tranksaksi peminjaman (pengembalian)

## update push 29-Juni-2022

### fitur announcement

- Membuat announcement table, announcement_category table, dan announcement_category_relation table
- Admin dapat membuat, menghapus, dan mengedit pengumuman
- User hanya dapat melihat pengumuman
- Lihat masing-masing model untuk mengetahui validasinya

test 'should create new book reviews on spesific book' do
@user3 = User.create(name: 'Gifar Ketiga', email: 'halo3@example.com', username: 'gifaraja3',
telephone: '0812345678922', password: 'admin1', role_id: 2)

    user_token = sign_in_as(@user3)

    post "/buku/#{@book.id}/reviews", params: { rating: 2, review: "kurang bagus"}, headers: {HTTP_AUTHORIZATION: "JWT #{user_token}"}

    assert_includes(@book.book_reviews, @user3.book_reviews[0])
    assert_response :success

end
