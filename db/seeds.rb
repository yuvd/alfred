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

user = User.create!(email: 'robert@gmail.com', password: '123456')

place1 = Place.create!(name: 'Yoga 4 U', category: Category.first, location: 'Ben Yehuda 32, Tel Aviv')
place2 = Place.create!(name: 'Yoga Sababa', category: Category.first, location: 'Bograshov 14, Tel Aviv')
place3 = Place.create!(name: 'Space', category: Category.first, location: 'Sheinkin 42, Tel Aviv')
place4 = Place.create!(name: 'FitFabric', category: Category.first, location: 'Allenby 14, Tel Aviv')
place5 = Place.create!(name: 'Aida', category: Category.first, location: 'Jabotinsky 14, Tel Aviv')
place6 = Place.create!(name: 'European Swimming Championships', category: Category.first, location: 'Herzeliya, Israel')
place7 = Place.create!(name: 'Olim in Tech', category: Category.last, location: 'Levinsky 14, Tel Aviv')
place8 = Place.create!(name: 'Type O Negative', category: Category.last, location: 'HaYarkon 14, Tel Aviv')
place9 = Place.create!(name: 'Dead Can Dance', category: Category.last, location: 'Eilat 14, Tel Aviv')
place10 = Place.create!(name: 'Holmes Place', category: Category.last, location: 'King George 14, Tel Aviv')
place11 = Place.create!(name: 'Yoga Beseder', category: Category.first, location: 'Bograshov 142, Tel Aviv')


preference1 = Preference.create!(user: user, category: Category.first)
preference2 = Preference.create!(user: user, category: Category.find(2))
preference3 = Preference.create!(user: user, category: Category.find(3))
puts "done"

