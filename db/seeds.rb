# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Outfit_categories.destroy_all
Shoe_categories.destroy_all
User.destroy_all
puts 'seed the user owner with owner@test.com and password 123456 '
user = User.create(email: "owner@test.com", password: "123456")

puts 'seeding outfit categories...'
color: (black, red, white, grey, navy, tan, leopard, khaki, orange, yellow, pink, silver, gold, rose_gold, multi, pattern)
style: (dress, top_and_trouser_combo, top_and_skirt_combo, suit, playsuit, jumpsuit, sport, co_ord_set)
outfit_category.save!
puts 'seeding outfit categories complete'

puts 'seeding shoe categories....'
color: (black, red, white, grey, navy, tan, leopard, khaki, orange, yellow, pink, silver, gold, rose_gold, multi, pattern)
style: (ankle_boots, tall_boots, ballerinas, trainers, court_shoes, heeled_sandals, wedges, mules, flat_sandals)
heel_height: (flat, mid_1_to_3_inches, high_over_3_inches)
shoe_category.save!
puts 'seeding shoe categories complete'