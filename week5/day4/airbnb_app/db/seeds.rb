# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dogsitter.destroy_all
Dog.destroy_all
Troll.destroy_all
City.destroy_all

city1 = City.create(name: "Paris01")
city2 = City.create(name: "Paris02")


ds1 = Dogsitter.create(name: "Hana", sex: "Female", age: 19, city: city1)
ds2 = Dogsitter.create(name: "Karen", sex: "Female", age: 22, city: city2)

dog1= Dog.create(name: "Dada", sex: "Male", city: city1)
dog2 = Dog.create(name: "Donie", sex: "Female", city: city2)


Troll.create(date: "20200730",dogsitter: ds1, dog: dog1, city: city1)
Troll.create(date: "20200730",dogsitter: ds2, dog: dog2, city: city2)

puts "----------------------"
puts "All the trolls: "
p Troll.all