# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

city1 = City.create(name: "Paris01", zip_code:"75001")
city2 = City.create(name: "Paris02", zip_code:"75002")
city3 = City.create(name: "Paris03", zip_code:"75003")
city4 = City.create(name: "Paris04", zip_code:"75004")

doc1 = Doctor.create(first_name: "Adame", last_name: "Levil", city: city1)
doc2 = Doctor.create(first_name: "Alan", last_name: "Walker", city: city2)

pat1 = Patient.create(first_name: "Dua", last_name: "Lipa", city: city2)
pat2 = Patient.create(first_name: "Adele", last_name: "Laurie", city: city3)

doc1.specialties.create(name: "SA")
doc2.specialties.create(name: "SB")

Appointment.create(doctor: doc1, patient: pat1, city: city4)
Appointment.create(doctor: doc2, patient: pat2, city: city4)

puts "----------------------"
puts "All the appointments: "
p Appointment.all