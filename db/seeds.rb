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

puts 'seed the user owner with owner@test.com and password 123456 '
user = User.create(email: "owner@test.com", password: "123456")

photos = ["https://li0.rightinthebox.com/images/x/201906/nrcr1559558239744.jpg","https://img.ltwebstatic.com/images3_pi/2020/08/20/1597906168b17a956b4736ce928d9bfc5b46aebde0_thumbnail_600x.webp","https://media.theeverygirl.com/wp-content/uploads/2019/10/fall-outfits-f.jpeg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0WQa1j0f-Ke22PMdvjTGZ0gl4ZA4BgQXjeRVHTE6pkECghXBohFkSB8JK-sPi4TJQyDcZOPY&usqp=CAc", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqlZw-knt3ZBI9dYZkBG8t4s5PTu3b_5Qeiv_5O-6nj_6cEAUBF91FmkkASQ&usqp=CAc","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd9nJ7UFnhzJxz2XR0R7VqqM3XlJaFGeew_UPYduBMt0U7Isf44bgpF1FQS2lIyg2b6kJI0u3RJg&usqp=CAc", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUdvMZ6SPjmiRwFRgTOZ1pvPoHghMgpPk07A&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0v7sGRMV8lKj8aXScM3DpJUDhvwOJY2QKpw&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrOnYKsTCorHm1ZQY5RjxoItzbXMVGC6t5PA&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2nGF-S7Mq7unPjbQHlXW_dQLZ7fnYc0bSWg&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROT10_cbZuSUKbviQdIetPtb1npHxUL0sxrw&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREe1s4QbkuQEdzZPea3P1y7pkwsrQ8QQlxMg&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuTvtZTSB7p-ash1pNLg8DPVbNe9Xd4Lv6rQ&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwALjiP1GbBO2CWWZIB_wIw8YTB40d6n1Iaw&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXnDxjAPI3wvHbfpLCYyaxJHw7EqaDGuUZTw&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReGQEwZTbKQzibcxz2iqJB1npDInWaeAiaSA&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf3F_D48wT_4HOyVSCeiNq6GTwr849w1-0YA&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBwuVfwegC9uVFGEVDJ3oa2JDCYgxUyZ7EqA&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF2YwqbDh4sS3DHMdQ4vBcPrj0Tss3puATLQ&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4_nj4jP7apCrKoudeagXnqwcDlK0NtiaxSA&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU5o62koTS1IVbp1QFFRx8bBpzcyFxpu2_hA&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREQxcye8DYWoEQsu-VIyH-zuxQFSyIy2r6eQ&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH4kVCfQXIoWP5QEqND6fn0GFJgnu3U3RJ4g&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSIByPFQWjuIuclf6siVxur3HrF_RHHKQm6Q&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8M1ct43Wkr1JbPN-oQVrIhbVzQmO72-pPPA&usqp=CAU", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/3f0749cd01c34f4fbc5f6f0bc40dc798/c8851109dfb642349c01a14834b03529.jpg?imwidth=600", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/48a3a67cec8e42a0b9a27c8ee1d4bf33/300e3cd8c0ed4f6fb3218545c89e9b92.jpg?imwidth=600", "https://mosaic03.ztat.net/vgs/media/outfit-image-mhq/06550bd3bcf64fe6b971848aa252ae2b/e229f95ad500419baf5e270dfb53e3c7.jpg?imwidth=600", "https://mosaic03.ztat.net/vgs/media/outfit-image-mhq/75f22956b8dd49cb93772dd15639a713/d6a53a5f924949f18eedf29999835308.jpg?imwidth=600", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/8a4a3eb5442440eeab7efb807f6a5314/4ec2dfb16ebc49a894681c24d2c7a0bb.jpg?imwidth=600", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/10a69d4434554edcb5603b3d74d55821/27adb05bde624d949317a0ef382c09fc.jpg?imwidth=600", "https://mosaic03.ztat.net/vgs/media/outfit-image-mhq/e729326745344ac69dced79c0b00259f/c085b3e2d4db496aa4ce90c81e28322b.jpg?imwidth=600", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/7dc5da2945674a219415a43d6fdace54/1103c66b974e4981b460d0f9f7361aef.jpg?imwidth=600", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/8ca0bfabe15e485d8ba6f731f05e07c1/9081499c3f86459d82386a50a79bee29.jpg?imwidth=600", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/7dbcc28ffdb44276a9e2f074c8f4a1c6/62c3458772f24a6aad4892b5d2a48833.jpg?imwidth=600", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/62efbcf1769041418f141f24c03df492/0910ee1277334dbb8bee94f6aaec47c7.jpg?imwidth=600", "https://mosaic03.ztat.net/vgs/media/outfit-image-mhq/f5e5fc2227f047df8a8fd992459783ae/068716b8c2f441aca69d5e51195b28f8.jpg?imwidth=600", "https://mosaic04.ztat.net/vgs/media/outfit-image-mhq/f2bf56fdef0640cdb2145df3965c8f3f/0a0c1d50a5d54ac3b44d04c676f8024d.jpg?imwidth=600", "https://mosaic03.ztat.net/vgs/media/outfit-image-mhq/f4d965a9385a4c74bbee06c72c0d190c/e3948041c09343ec92c3cb6d3687b8b1.jpg?imwidth=600", "https://mosaic03.ztat.net/vgs/media/outfit-image-mhq/0e944673e98c411ebfd173ab1fb92cc4/fd7df14bddc446f0a0cb8dc097edc399.jpg?imwidth=600", "https://mosaic03.ztat.net/vgs/media/outfit-image-mhq/bd9f61fdba12405592c5a1c35e96d929/f1c3972ce84741c7809ed2de7439b3a4.jpg?imwidth=600"]
puts 'seeding outfits...'
photos.each do |photo|
  outfit = Outfit.new(
    user_id: user.id,
    brand: %w[Topshop Zara H&M RiverIsland COS Monki MintVelvet].sample,
    event_type: %w[wedding_or_bridal business cocktail_party ball_or_prom party night_out formal_event casual_event date outdoor_event].sample,
    walking_time: %w[under_one_hour up_to_5_hours more_than_5_hours].sample,
    event_date: DateTime.now + 1.day
  )
    file = URI.open(photo)
    outfit.photo.attach(io: file, filename: "outfit.jpg", content_type: 'image/jpg')
  outfit.save!
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

outfit = Outfit.new(brand: "topshop", event_type: "date", walking_time: "under one hour")
