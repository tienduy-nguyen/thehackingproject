# Initialize datas
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all

# Create Cities
city1 = City.create(name: "Paris01", zip_code:"75001")
city2 = City.create(name: "Paris02", zip_code:"75002")
city3 = City.create(name: "Paris03", zip_code:"75003")
city4 = City.create(name: "Paris04", zip_code:"75004")

# Create Doctors
doc1 = Doctor.create(first_name: "Adame", last_name: "Levil", city: city1)
doc2 = Doctor.create(first_name: "Alan", last_name: "Walker", city: city2)

# Create Patients
pat1 = Patient.create(first_name: "Dua", last_name: "Lipa", city: city2)
pat2 = Patient.create(first_name: "Adele", last_name: "Laurie", city: city3)

# Create Specialities
doc1.specialties.create(name: "SA")
doc2.specialties.create(name: "SB")

# Create Appointements
Appointment.create(doctor: doc1, patient: pat1, city: city4)
Appointment.create(doctor: doc2, patient: pat2, city: city4)

puts "----------------------"
puts "All the appointments: "
p Appointment.all