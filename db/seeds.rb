# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Place.destroy_all
Preference.destroy_all
Category.destroy_all
User.destroy_all

CategoryService.new.perform

usero = User.create!(email: 'brucewayne@gmail.com', name: 'Bruce Wayne', nickname: 'Bats', password: '123456', photo: )
user1 = User.create!(email: 'robert@gmail.com', name: 'Robert', nickname: 'Robert', password: '123456')
user2 = User.create!(email: 'david@gmail.com', name: 'David', nickname: 'Dav', password: '123456', photo: 'Rabea_jhxjj9')
user3 = User.create!(email: 'ben@gmail.com', name: 'Ben', nickname: 'Benny', password: '123456' , photo: 'Ben_ax5krf')
user4 = User.create!(email: 'clara@gmail.com', name: 'Clara', nickname: 'clari', password: '123456', photo: ' Clara_gsgez3')
user5 = User.create!(email: 'rabea@gmail.com', name: 'Rabea', nickname: 'Rabi', password: '123456', photo: 'Rabea_jhxjj9')
user6 = User.create!(email: 'joy@gmail.com', name: 'Bruce Wayne', nickname: 'J.Oy.', password: '123456', photo: 'Joy_jptyn3')

puts "done"

