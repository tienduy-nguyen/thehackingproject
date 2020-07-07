puts "What is your year of birth?"
print ">"
year_input = gets.chomp
while !/\A[-+]?\d+\z/.match(year_input)
  #Is not a number
  puts "Input must be a number of year!"
  puts "Please try again!"
  print ">"
  year_input = gets.chomp
end  

# Press Ctrl + C to quit the Ruby program
puts "Your age is #{2017 - year_input.to_i}"
