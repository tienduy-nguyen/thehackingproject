# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
GossipTag.destroy_all

cities = Array.new
users = Array.new
gossips = Array.new
tags = Array.new


10.times do
  city = City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code,
  )
  cities << city
end

10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
    email: Faker::Internet.email,
    age: rand(18..75),
    city_id: cities[rand(0..9)].id,
  )
  users << user
end

  20.times do
    gossip = Gossip.create(
      title: Faker::Movie.title,
      content: Faker::Quote.famous_last_words,
      user_id: users[rand(0..9)].id,
    )
    gossips << gossip
  end

  10.times do
    tag = Tag.create(
      title: "#" + Faker::Dessert.variety,
    )
    tags << tag
  end

  30.times do
    gossip_tag = GossipTag.create(
      tag_id: tags[rand(0..9)].id,
      gossip_id: gossips[rand(0..19)].id,
    )
  end

  15.times do
    private_message = PrivateMessage.create(
      recipient_id: users[rand(0..9)].id,
      sender_id: users[rand(0..9)].id,
      content: Faker::Movie.quote,
    )
  end
