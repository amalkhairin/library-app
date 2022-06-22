# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
roles = Role.create([{role: "admin"}, {role: "visitor"}])
admin = User.create(name: "admin", role_id:1, username: "admin", password: "admin", email: "admin@example.com", telephone: "0812345678210")
