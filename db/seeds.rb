# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
roles = Role.create([{id: 1, role: "admin"}, {id: 2, role: "visitor"}])

admin = User.create([{name: "admin", role_id:1, username: "admin", password: "admin", email: "admin@example.com", telephone: "0812345678210"}])

buku = Buku.create([{judul:"Buku Bahasa Indonesia SMP Kelas 8", deskripsi: "Buku Bahasa Indonesia SMP Kelas 8",penulis:"I Made Eko Satria Wiguna",penerbit:"Gajah Pintar",jumlah_buku:12, isAvailable:1}])

category = Category.create([{name: "Bahasa Indonesia"}])

review_bukus = ReviewBuku.create([{user_id: 1, buku_id:1, rating: 4, ulasan:"Buku ini menarik sekali"}])

# Role.delete_all
# User.delete_all
# Buku.delete_all
# Category.delete_all
# ReviewBuku.delete_all