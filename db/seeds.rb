# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

roles = Role.create([{ role: 'admin' }, { role: 'visitor' }])

admin = User.create(name: 'admin', role_id: 1, username: 'admin', password: 'admin', email: 'admin@example.com',
                    telephone: '0812345678210')

user = User.create(name: 'user', role_id: 2, username: 'user12', password: 'password', email: 'user@example.com',
                   telephone: '08123444441342')

# buku = Buku.create(judul:"Buku Bahasa Indonesia SMP Kelas 8", deskripsi: "Buku Bahasa Indonesia SMP Kelas 8",penulis:"I Made Eko Satria Wiguna",penerbit:"Gajah Pintar",jumlah_buku:12, is_available: true)

category = Category.create([{ name: 'Bahasa Indonesia' }, { name: 'IPA' }, { name: 'Ekonomi' }])

book1 = Buku.create(judul: 'Sejarah Bahasa', deskripsi: 'Mempelajari sejarah bahasa indonesia',
                    penerbit: 'Generasi Gigih', barcode: '141234235', isbn: '12414124', penulis: 'Gifar', jumlah_buku: 3, is_available: true)

book2 = Buku.create(judul: 'Sejarah Bahasa 2', deskripsi: 'Mempelajari sejarah bahasa indonesia 2',
                    penerbit: 'Generasi Gigih', barcode: '1412342352', isbn: '124141242', penulis: 'Gifar', jumlah_buku: 2, is_available: true)

book3 = Buku.create(judul: 'Sejarah Bahasa 3', deskripsi: 'Mempelajari sejarah bahasa indonesia 3',
                    penerbit: 'Generasi Gigih', barcode: '14123342352', isbn: '1241413242', penulis: 'Gifar', jumlah_buku: 2, is_available: false)
