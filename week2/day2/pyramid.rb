puts "Enter a number between 1 and 25"
print ">"
num_input = gets.chomp

# Check if input is number
while !/\A\d+\z/.match(num_input) || num_input.to_i > 25 || num_input.to_i < 1 
  puts "Please enter a valid number between 1 and 25"
  print ">"
  num_input = gets.chomp
end  

num_input = num_input.to_i
puts "Here is a pyramid"

num_input.times do |num|
  puts " " * (num_input - num-1) + "#" * (num+1)
end