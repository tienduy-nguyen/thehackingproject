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
# puts "Your age is #{2017 - year_input.to_i}"
puts "The list of year: "
year_input = year_input.to_i
while year_input <= 2020
  puts year_input
  year_input+=1
end

