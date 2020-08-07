
# # # User.destroy_all
# # # City.destroy_all
# # # Gossip.destroy_all
# # # PrivateMessage.destroy_all
# # # Comment.destroy_all
# # # GossipTag.destroy_all
# # # Tag.destroy_all

10.times do
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code,
  )
end
puts "Cities created!"

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
    email: Faker::Internet.email,
    age: rand(18..75),
    city: City.all.sample,
  )
end
puts "Users created!"

20.times do
  Gossip.create(
    title: Faker::Movie.title[0..11],
    content: Faker::Quote.matz,
    user: User.all.sample,
  )
end
puts "Gossips created!"

10.times do
  title = Faker::Dessert.variety.strip.downcase
  title.gsub!(/\s+/, '-')
  Tag.create(
    title: title,
  )
end
puts "Tags created!"

30.times do
  GossipTag.create(
    tag: Tag.all.sample,
    gossip: Gossip.all.sample,
  )
end
puts "GossipsTags created!"

15.times do
  PrivateMessage.create(
    recipient: User.all.sample,
    sender: User.all.sample,
    content: Faker::Movie.quote,
  )
end
puts "PrivateMessages created!"

