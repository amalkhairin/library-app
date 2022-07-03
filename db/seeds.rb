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

buku = Buku.create([{judul:"Buku Bahasa Indonesia SMP Kelas 8", deskripsi: "Buku Bahasa Indonesia SMP Kelas 8",penulis:"I Made Eko Satria Wiguna",penerbit:"Gajah Pintar",jumlah_buku:12, is_available: true, barcode:"10294",isbn: "102ko2",category_ids:[1]}])

buku2 = Buku.create([{judul:"Buku Bahasa Indonesia SMP Kelas 9", deskripsi: "Buku Bahasa Indonesia SMP Kelas 9",penulis:"I Made Eko Satria Wiguna",penerbit:"Gajah Pintar",jumlah_buku:12, is_available: true, barcode:"10294",isbn: "102ko2",category_ids:[1]}])

buku3 = Buku.create([{judul:"Buku IPA SMP Kelas 8", deskripsi: "Buku IPA SMP Kelas 8",penulis:"I Made Eko Satria Wiguna",penerbit:"Gajah Pintar",jumlah_buku:12, is_available: true, barcode:"10294",isbn: "102ko2",category_ids:[2]}])

review_bukus = ReviewBuku.create([{user_id: 1, buku_id:1, rating: 4, ulasan:"Buku ini menarik sekali"}])

announcement_categories = AnnouncementCategory.create(category_name: "Peminjaman")

announcement = Announcement.create(title:"Cara peminjaman buku", description:"berikut tata cara peminjaman buku", user_id:1)

# To delete all data from the specified table
# Remove "#" from the beginning of the string to

# Role.delete_all
# User.delete_all
# Buku.delete_all
# Category.delete_all
# ReviewBuku.delete_all
# BookCategory.delete_all
# AnnouncementCategory.delete_all
# Announcement.delete_all

# role hanya mengisi dua data yaitu admin dengan id = 1, dan visitor id = 2 
# roles = Role.create([
#           { role: 'admin' }, 
#           { role: 'visitor' }
#         ])

# pembuatan akun user
# user = User.create([
#           {
#             name: 'admin', 
#             role_id: 1, 
#             username: 'admin',
#             password: 'admin',
#             email: 'admin@example.com',
#             telephone: '0812345678210'
#           },
#           {
#             name: 'user pertama', 
#             role_id: 2, 
#             username: 'user1', 
#             password: 'password', 
#             email: 'user@example.com',
#             telephone: '08123444441342'
#           },
#           {
#             name: 'user kedua', 
#             role_id: 2, 
#             username: 'user2', 
#             password: 'password', 
#             email: 'user2@example.com',
#             telephone: '08123444441341'
#           } 
#         ])


# # Book Category

# category = Category.create([
#             { name: 'Bahasa Indonesia' }, 
#             { name: 'IPA' }, 
#             { name: 'Ekonomi' }
#           ])



# # Book

# book1 = Buku.create([ 
#             {
#               judul: 'Sejarah Bahasa', 
#               deskripsi: 'Mempelajari sejarah bahasa indonesia',
#               penerbit: 'Generasi Gigih', 
#               barcode: '141234235', 
#               isbn: '12414124', 
#               penulis: 'Gifar', 
#               jumlah_buku: 3, 
#               is_available: true
#             },
#             {
#               judul: 'Sejarah Bahasa 2', 
#               deskripsi: 'Mempelajari sejarah bahasa indonesia 2',
#               penerbit: 'Generasi Gigih', 
#               barcode: '1412342352', 
#               isbn: '124141242', 
#               penulis: 'Gifar', 
#               jumlah_buku: 5,
#               is_available: true
#             },
#             {
#               judul: 'Sejarah Bahasa 3', 
#               deskripsi: 'Mempelajari sejarah bahasa indonesia 3',
#               penerbit: 'Generasi Gigih', 
#               barcode: '14123342352', 
#               isbn: '1241413242', 
#               penulis: 'Gifar', 
#               jumlah_buku: 0, 
#               is_available: false
#             }
#         ])

# # Announcement Category 

# announcement_category = AnnouncementCategory.create([
#       {
#         category_name: "libur"
#       },
#       {
#         category_name: "maintenance"
#       }
# ])
