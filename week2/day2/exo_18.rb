puts "List of fake emails"

50.times do |num|
  if num < 9
    puts "jean.dupont.0#{num+1}@email.fr"
  else
    puts "jean.dupont.#{num+1}@email.fr"
  end
end