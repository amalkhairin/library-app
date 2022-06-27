# Library APP

Library app is an Library API. This API can help you built your own library without to think about your backend side. We've been develop backend side for you. You just need integrated your apps via API.

For more information, see [WIKI](https://github.com/amalkhairin/library-app/wiki#documentation-libary-app) for documentation.

# README

## Update push 26-Juni-2022

### 1. Menambahkan gem

Menambahkan gem rubocop ke dalam Gemfile, gunakan rubocop -A untuk menjalankan autocorrection ruby style guide [GitHub Pages](https://rubocop.org/).

### 2. Memperbaiki bug di CRUD Buku

**Column isAvailable telah __diganti__ menjadi is_available dengan nilai awal integer menjadi boolean**.

* Menambahakan validasi kedalam model Buku (Lihat **app/model/buku.rb**).

* Membuat model test pada buku gunakan **rails test .\test\models\buku_test.rb** untuk menjalankan test.

* Membuat controller test pada buku gunakan **rails test .\test\controllers\buku_controller_test.rb** untuk menjalankan test.

### 3. Memperbaiki Bug di CRUD Category

* **Mengubah** relasi antara category dan buku menjadi N:N, dengan table sebagai berikut
   * Table Categories
   * Table Book_Categories sebagai perantara 
   * Table Buku
 Lihat *schema.rb* untuk melihat detail column pada masing-masing table.
 
* Menambahkan Controller test pada category gunakan **rails test .\test\controllers\categories_controller_test.rb** untuk menjalankan test.
* Menambahkan Model test pada category gunakan **rails test .\test\models\category_test.rb** untuk menjalankan test.

### 4.Membuat Fitur Search Book
Membuat fitur untuk melakukan pencarian buku sesuai judul

### 5. Refactor Code Agar Lebih Mudah Dibaca

Hanya menerapkan clean code pada project

  
   
