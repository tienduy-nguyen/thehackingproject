number_of_hours_worked_per_day = 10
number_of_days_worked_per_week = 5
number_of_weeks_in_THP = 11

puts "Travail : #{number_of_hours_worked_per_day * number_of_days_worked_per_week * number_of_weeks_in_THP}"

puts "Et en minutes ça fait : #{number_of_minutes_in_an_hour * number_of_hours_worked_per_day * number_of_days_worked_per_week * number_of_weeks_in_THP}"

# After execute the program with the last line added, we will have an error.
# Name of error: undefined local variable or method `number_of_minutes_in_an_hour`
# The problem is: we didn't declare the variable `number_of_minutes_in_an_hour` yet
# So the compiler will not understand it and throw an error