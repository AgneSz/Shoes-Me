# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

Outfit.destroy_all
User.destroy_all
OutfitCategory.destroy_all
ShoeCategory.destroy_all
Category.destroy_all

usernames = ["Radha1307", "chloeblc", "BastienMatis", "AgneSz", "Haumer"]

puts 'seed the users '
usernames.each do |username|
  user = User.create!(
    email: "#{username}@gmail.com",
    password: "123456"
  )
  file = URI.open("https://kitt.lewagon.com/placeholder/users/#{username}")
  user.avatar.attach(io: file, filename: "#{username}.jpg", content_type: 'image/jpg')
  user.save!
end

i = 0
photos = ["cute_summer_dress.jpg","all_beige_outfit.jpg", "beige_floral_dress.jpg"]
puts 'seeding outfits...'
3.times do
  outfit = Outfit.new(
    user: User.all.sample,
    event_date: (Date.today..(Date.today + 1.year)).to_a.sample + (10..22).to_a.sample.hours,
    event_type: %w[wedding_or_bridal business cocktail_party ball_or_prom party night_out formal_event casual_event date outdoor_event].sample,
    walking_time: %w[under_one_hour up_to_5_hours more_than_5_hours].sample
  )
    file =  File.open(Rails.root.join("app","assets","images", photos[i]))
    outfit.photo.attach(io: file, filename: "outfit.png", content_type: 'image/png')
  outfit.save!
  i += 1
end
puts 'seeding outfits complete'


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


