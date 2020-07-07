puts "List of pair emails"

50.times do |num|
  true_num  = num +1
  if (true_num % 2 == 0)
    if true_num < 9
      puts "jean.dupont.0#{true_num}@email.fr"
    else
      puts "jean.dupont.#{true_num}@email.fr"
    end
  end  
end