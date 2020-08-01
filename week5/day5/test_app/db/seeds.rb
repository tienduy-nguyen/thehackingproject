require 'faker'

User.destroy_all
City.destroy_all
Listing.destroy_all
Reservation.destroy_all

20.times do |i|
  User.create(email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone_in_e164[1..-1], description: Faker::Lorem.sentence(word_count: rand(10..20)))
end
puts "Create 20 users, done!"

10.times do |i|
  City.create(name: Faker::Address.city, zip_code: Faker::Number.number(digits: 6))
end
puts "Create 10 cities, done!"

# 50.times do |i|
#   Listing.create(available_beds: rand(1..4), price: rand(50..500), has_wifi: true, welcome_message: Faker::Lorem.sentence(word_count: rand(20..50)),description: Faker::Lorem.sentence(word_count: rand(200..500)))
# end
# puts "Create 50 listings, done!"

# lists = Listing.all

# lists.each do |item|

# end