puts "What is your age?"
print ">"
age_input = gets.chomp
while !/\A\d+\z/.match(age_input)
  #Is not a number
  puts "Input must be a positive number!"
  puts "Please try again!"
  print ">"
  age_input = gets.chomp
end  

# Press Ctrl + C to quit the Ruby program
# puts "Your age is #{2017 - age_input.to_i}"
puts "The list of year: "
age_input = age_input.to_i
This_year = 2020
my_age = 0


while age_input >= 0
  puts "Year of birth : #{This_year - age_input} - He is #{age_input} years old, you are #{my_age} years old"
  age_input-=1
  my_age +=1
end

