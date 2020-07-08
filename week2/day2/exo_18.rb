puts "List of fake emails"

emails = []
count = 0
50.times do |num|
  if num < 9
    emails[count] = "jean.dupont.0#{num+1}@email.fr"
  else
    emails[count] = "jean.dupont.#{num+1}@email.fr"
  end
  count += 1
end

puts emails