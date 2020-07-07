print "Enter number of users: "

num_users = gets.chomp
# Check input
while !/\A[-+]?\d+\z/.match(num_users)
  #Is not a number
  puts "Input must be a positive number!"
  print "Enter number of users: "
  num_users = gets.chomp
end  

# Press Ctrl + C to quit the Ruby program
# puts "Your age is #{2017 - num_users.to_i}"
puts "List countdown of number: "
num_users = num_users.to_i
while num_users >= 0
  puts num_users
  num_users -= 1
end

