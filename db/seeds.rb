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

user0 = User.create!(email: 'brucewayne@gmail.com', name: 'Bruce Wayne', nickname: 'Bats', password: '123456', remote_photo_url: 'https://res.cloudinary.com/dodsrfkhr/image/upload/v1569415877/Yuval2_rbs5i0.jpg')
user1 = User.create!(email: 'robert@gmail.com', name: 'Robert', nickname: 'Robert', password: '123456', remote_photo_url: 'https://res.cloudinary.com/dodsrfkhr/image/upload/v1569415877/Yuval2_rbs5i0.jpg')
user2 = User.create!(email: 'david@gmail.com', name: 'David', nickname: 'Dav', password: '123456', remote_photo_url: 'https://res.cloudinary.com/dodsrfkhr/image/upload/v1569409595/David_w2y7oa.jpg')
user3 = User.create!(email: 'ben@gmail.com', name: 'Ben', nickname: 'Benny', password: '123456' , remote_photo_url: 'https://res.cloudinary.com/dodsrfkhr/image/upload/v1569409604/Ben_ax5krf.jpg')
user4 = User.create!(email: 'clara@gmail.com', name: 'Clara', nickname: 'clari', password: '123456', remote_photo_url: 'https://res.cloudinary.com/dodsrfkhr/image/upload/v1569409591/Clara_gsgez3.jpg')
user5 = User.create!(email: 'rabea@gmail.com', name: 'Rabea', nickname: 'Rabi', password: '123456', remote_photo_url: 'https://res.cloudinary.com/dodsrfkhr/image/upload/v1569409617/Rabea_jhxjj9.jpg')
user6 = User.create!(email: 'joy@gmail.com', name: 'Joy', nickname: 'J.Oy.', password: '123456', remote_photo_url: 'https://res.cloudinary.com/dodsrfkhr/image/upload/v1569416547/joy2_jz7qgz.jpg')

puts "done"

