puts "List of pair emails"

emails = []
count = 0

50.times do |num|
  true_num  = num +1
  if (true_num % 2 == 0)
    if true_num < 9
      emails[count] = "jean.dupont.0#{true_num}@email.fr"
    else
      emails[count] = "jean.dupont.#{true_num}@email.fr"
    end
    count +=1
  end  
end

puts emails