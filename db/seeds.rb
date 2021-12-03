# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

filepath = 'app/assets/seedata/hotels.json'

serialized_hotels = File.read(filepath)

hotels = JSON.parse(serialized_hotels)

puts "Cleaning DB 🧹"
Listing.destroy_all
User.destroy_all
Review.destroy_all
Reservation.destroy_all
Booking.destroy_all

puts "Creating the dummy hotel partner 🏨"
User.create!(
  email: "test@test.com",
  password: "12345678!",
  hotel_partner: true,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)

Faker::Config.locale = 'en-US'
puts "Seeding Users and Daypasses 🌱"
20.times do
  puts "Creating the Users 🙋🏻‍♂️"
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
end


count = 1
puts "Creating the listing 🏩"
hotels.each do |key, _value|
  # binding.pry
  Listing.create!(
    name: key,
    address: hotels[key]["full_address"],
    details: hotels[key]["description"],
    city: hotels[key]["city"],
    state: hotels[key]["state"],
    country: "United States of America",
    facilities: hotels[key]["icons"],
    hours: hotels[key]["hours"],
    user_id: User.first.id
  )
  # binding.pry
  puts "Creating Adult and Child Prices 👨‍👧"
  DayPass.create!(
    adult_price: rand(89..129),
    child_price: rand(39..69),
    details: hotels[key]["passes"],
    listing_id: Listing.last.id
  )
  puts "Seeding the reviews 🌱"
  rand(1..50).times do
    Review.create!(
      title: Faker::Marketing.buzzwords,
      content: Faker::Restaurant.review,
      rating: rand(3..5),
      user_id: User.all.sample.id,
      listing_id: Listing.last.id
    )
  end

  count += 1
  # p key # hotel name
  # p hotels[key]["description"] #description
  # p hotels[key]["hours"] #hours
  # p hotels[key]["address"] #address
  # p hotels[key]["city"] #city
  # p hotels[key]["state"] #state
  # p hotels[key]["icons"] #icons
end






puts "Seeding Done"
