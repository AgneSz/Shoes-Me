# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
OutfitCategory.destroy_all
ShoeCategory.destroy_all
Category.destroy_all
User.destroy_all
puts 'seed the user owner with owner@test.com and password 123456 '
user = User.create(email: "owner@test.com", password: "123456")

puts 'seeding outfit categories...'
names = %w[black red white grey navy tan leopard khaki orange yellow pink silver gold rose_gold multi pattern dress top_and_trouser_combo top_and_skirt_combo suit playsuit jumpsuit sport co_ord_set]
names.each do |name|
  Category.create! name: name, shoe: false
end
puts 'seeding outfit categories complete'

puts 'seeding shoe categories....'
names = %w[black red white grey navy tan leopard khaki orange yellow pink silver gold rose_gold multi pattern ankle_boots tall_boots ballerinas trainers court_shoes heeled_sandals wedges mules flat_sandals flat mid_1_to_3_inches high_over_3_inches]
names.each do |name|
  Category.create! name: name, shoe: true
end
puts 'seeding shoe categories complete'