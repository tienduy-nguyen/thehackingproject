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
  city = City.find(i)
  User.create(first_name: "User#{(i+1)}", last_name: "Adev42", description: "This is a fake data #{i+1}", email: "#{first_name}.#{last_name}@gmail.com", age: {i+1} , city: city)
end


# Create 20 gossips
20.times do |i|

end

# Create 10 tags
