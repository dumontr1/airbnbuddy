# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Booking.destroy_all
Offer.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create!( nickname: "Mohammed", email: "mohammed@gmail.com", password: "azerty" )
user2 = User.create!( nickname: "Robin", email: "robin@gmail.com", password: "azerty" )
user3 = User.create!( nickname: "Mattéo", email: "matteo@gmail.com", password: "azerty" )



puts "Creating offers..."
offer1 = Offer.create!( title: "Lavage de voiture", details: "Lavage eco-responsable de voiture à domicile ou au bureau.", price: 20, city: "Toulouse", user_id: user1.id )
offer2 = Offer.create!( title: "Déménagement", details: "Transporter et porter des charges lourdes et les monter sur plusieurs étages.", city: "Bordeaux", price: 30, user_id: user2.id )
offer3 = Offer.create!( title: "Tondre la pelouse", details: "Tondre la pelouse. Tailler une haie. Arroser le jardin.", price: 25, city: "Le Mans", user_id: user3.id )


puts "Creating bookings..."
booking1 = { status: 1, start_date: Date.parse("22/08/2021"), end_date: Date.parse("22/08/2021"), offer: offer2, user: user1 }
booking2 = { status: 1, start_date: Date.parse("23/08/2021"), end_date: Date.parse("23/08/2021"), offer: offer3, user: user2 }
booking3 = { status: 1, start_date: Date.parse("24/08/2021"), end_date: Date.parse("24/08/2021"), offer: offer1, user: user3 }

[ booking1, booking2, booking3 ].each do |attributes|
  booking = Booking.create!(attributes)
  puts "Created booking#{booking.id}"
end

puts "Finished!"
