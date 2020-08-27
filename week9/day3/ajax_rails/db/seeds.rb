
5.times do 
  Book.create(author: Faker::Book.author, title: Faker::Book.title)
end