print "Enter number of users: "

number_users = gets.chomp
while !/\A\d+\z/.match(number_users)
  #Is not a positive number
  puts "Input must be a positive number!"
  print "Enter number of users: "
  number_users = gets.chomp
end  

# Press Ctrl + C to quit the ruby program
number_users.to_i.times do |num|
  puts num+1
end