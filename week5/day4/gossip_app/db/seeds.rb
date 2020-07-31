User.destroy_all
City.destroy_all
Gossip.destroy_all
Tags.destroy_all
PrivateMessage.destroy_all
Like.destroy_all

# Create 10 cities
10.times do |i|
  City.create(name: "City#{i+1}", zip_code: "000#{(i+1).to_s}")
end


# Create 10 Users
10.times do |i|
  city = City.find(i+1)
  User.create(first_name: "User#{(i+1)}", last_name: "Adev42", description: "This is a fake data #{i+1}", email: "user#{(i+1)}.adev42@gmail.com", age: (i+1) , city: city)
end


# Create 20 gossips
id = 1
20.times do |i|
  id = id > 10 ? 1 : id
  user = User.find(id)
  Gossip.create(title: "This is the gossip #{i+1} of #{user.first_name}", content: "This is just a test #{i+1}", user: user)
  id += 1
end

# Create 10 tags
10.times do |i|
  gossip = Gossip.find(i+1)
  gossip.tags.create(title: "Tag#{i+1}")
end

# Private messges
user1 = User.first
user2 = User.find(2)
user3 = User.find(3)
user4 = User.find(4)
user5 = User.find(5)


msg = PrivateMessage.create(content: "Hey, I just send you a message! ", sender: user1, recipient: user2)

# Create 20 comments
20.times do |i|
  user = User.find(rand(1..10))
  gossip  =Gossip.find(rand(1..20))
  Comment.create(content: "Hi, I love your gossip!", user:user,gossip: gossip)
end

# Create 20 likes
20.times do |i|
  user = User.find(rand(1..10))
  gossip  =Gossip.find(rand(1..20))
  comment = Comment.find(rand(1..20))
  choice = rand(1..2)
  if choice == 1
    Like.create(user:user,gossip: gossip)
  else
    Like.create(user:user,comment: comment)
  end
end

puts "End of the world!!!!"
puts "--------------------"