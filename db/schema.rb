# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_23_092202) do
  create_table "bukus", force: :cascade do |t|
    t.integer "category_id"
    t.string "barcode"
    t.string "isbn"
    t.string "judul"
    t.string "deskripsi"
    t.string "penulis"
    t.string "penerbit"
    t.string "gambar_buku"
    t.string "file_buku"
    t.string "bahasa"
    t.string "edisi"
    t.integer "tahun_terbit"
    t.string "subject"
    t.string "lokasi"
    t.integer "jumlah_buku"
    t.boolean "is_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peminjaman_bukus", force: :cascade do |t|
    t.integer "id_buku"
    t.datetime "jadwal_pinjam"
    t.datetime "jadwal_kembali"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "role_id"
    t.string "profile"
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "telephone"
    t.datetime "birthday"
    t.string "gender"
    t.string "address"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "confirmed_at"
  end

end
