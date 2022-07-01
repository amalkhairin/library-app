# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Data Starter. You can change the data below
# Remove id if you got trouble with database errors

roles = Role.create([{id: 1, role: "admin"}, {id: 2, role: "visitor"}])

admin = User.create([{name: "admin", role_id:1, username: "admin", password: "admin", email: "admin@example.com", telephone: "0812345678210"}])

user = User.create(name: 'user', role_id: 2, username: 'user', password: 'password', email: 'user@example.com', telephone: '08123444441342')

# Remove id if you got trouble with database errors
category = Category.create([{id: 1, name: 'Bahasa Indonesia' }, {id:2, name: 'IPA' }, {id:3, name: 'Ekonomi' }])

buku = Buku.create([{judul:"Buku Bahasa Indonesia SMP Kelas 8", deskripsi: "Buku Bahasa Indonesia SMP Kelas 8",penulis:"I Made Eko Satria Wiguna",penerbit:"Gajah Pintar",jumlah_buku:12, is_available: true, barcode:"10294",isbn: "102ko2",category_ids:[1,2]}])

review_bukus = ReviewBuku.create([{user_id: 1, buku_id:1, rating: 4, ulasan:"Buku ini menarik sekali"}])


# Buku.create(judul:"Bahasa Indonesia SMP Kelas 8", deskripsi:"Buku Bahasa Indonesia Kelas 8",penerbit:"Gajah Dud
#     uk",penulis:"I Made Eko",jumlah_buku:12,is_available: true, category_ids:[1,2])

# category = Category.create([{name: "Bahasa Indonesia"}])

# To delete all data from the specified table
# Remove "#" from the beginning of the string to

# Role.delete_all
# User.delete_all
# Buku.delete_all
# Category.delete_all
# ReviewBuku.delete_all
# BookCategory.delete_all