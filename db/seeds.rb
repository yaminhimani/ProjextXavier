# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Admin-Tommy", password: "password", user_type: 'Admin')
User.create(username: "Admin-Brian", password: "password", user_type: 'Admin')
User.create(username: "Admin-Yamin", password: "password", user_type: 'Admin')
User.create(username: "Admin-Wong", password: "password", user_type: 'Admin')
#admin accounts for app
