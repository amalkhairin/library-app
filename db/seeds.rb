# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

roles = Role.create([{role: "admin"}, {role: "visitor"}])

admin = User.create(name: "admin", role_id:1, username: "admin", password: "admin", email: "admin@example.com", telephone: "0812345678210")

buku = Buku.create(judul:"Buku Bahasa Indonesia SMP Kelas 8", category_id:3, deskripsi: "Buku Bahasa Indonesia SMP Kelas 8",penulis:"I Made Eko Satria Wiguna",penerbit:"Gajah Pintar",jumlah_buku:12, is_available: true)

category = Category.create(name: "Bahasa Indonesia")
