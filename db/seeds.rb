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

user = User.create!(email: 'robert@gmail.com', password: '123456')
category1 = Category.create!(name: 'Yoga')
category2 = Category.create!(name: 'Concerts')
category3 = Category.create!(name: 'Gym')
category4 = Category.create!(name: 'Spectacles')
category5 = Category.create!(name: 'Job fairs')
category6 = Category.create!(name: 'Sports championships')

place1 = Place.create!(name: 'Yoga 4 U', category: category1, location: 'Ben Yehuda 32, Tel Aviv')
place2 = Place.create!(name: 'Yoga Sababa', category: category1, location: 'Bograshov 14, Tel Aviv')
place3 = Place.create!(name: 'Space', category: category3, location: 'Sheinkin 42, Tel Aviv')
place4 = Place.create!(name: 'FitFabric', category: category3, location: 'Allenby 14, Tel Aviv')
place5 = Place.create!(name: 'Aida', category: category4, location: 'Jabotinsky 14, Tel Aviv')
place6 = Place.create!(name: 'European Swimming Championships', category: category6, location: 'Herzeliya, Israel')
place7 = Place.create!(name: 'Olim in Tech', category: category5, location: 'Levinsky 14, Tel Aviv')
place8 = Place.create!(name: 'Type O Negative', category: category2, location: 'HaYarkon 14, Tel Aviv')
place9 = Place.create!(name: 'Dead Can Dance', category: category2, location: 'Eilat 14, Tel Aviv')
place10 = Place.create!(name: 'Holmes Place', category: category3, location: 'King George 14, Tel Aviv')

preference1 = Preference.create!(user: user, category: category5)
preference2 = Preference.create!(user: user, category: category4)
preference3 = Preference.create!(user: user, category: category3)
puts "done"








