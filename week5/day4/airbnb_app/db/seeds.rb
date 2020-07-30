# Initilize datas
Dogsitter.destroy_all
Dog.destroy_all
Troll.destroy_all
City.destroy_all

# Create Cities
city1 = City.create(name: "Paris01")
city2 = City.create(name: "Paris02")

# Create Dogsitters
ds1 = Dogsitter.create(name: "Hana", sex: "Female", age: 19, city: city1)
ds2 = Dogsitter.create(name: "Karen", sex: "Female", age: 22, city: city2)


dog1= Dog.create(name: "Dada", sex: "Male", city: city1)
dog2 = Dog.create(name: "Donie", sex: "Female", city: city2)


Troll.create(date: "20200730",dogsitter: ds1, dog: dog1, city: city1)
Troll.create(date: "20200730",dogsitter: ds2, dog: dog2, city: city2)

puts "----------------------"
puts "All the trolls: "
p Troll.all