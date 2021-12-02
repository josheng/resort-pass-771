# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB 🧹"
Listing.destroy_all
User.destroy_all
Review.destroy_all
Reservation.destroy_all
Booking.destroy_all

puts "Creating the dummy hotel partner 🏨"
User.create!(email: "test@test.com", password: "12345678!", hotel_partner: true)

Faker::Config.locale = 'en-US'
puts "Seeding Users, Listing and Daypasses 🌱"
20.times do |index|
  puts "Creating the Users 🙋🏻‍♂️"
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
  puts "Creating the listing 🏩"
  city = Faker::Address.city
  Listing.create!(
    name: "#{city} Hotel",
    address: Faker::Address.street_address,
    details: Faker::Lorem.paragraph(sentence_count: 10),
    city: city,
    state: Faker::Address.state,
    country: "United States of America",
    user_id: 1
  )
  puts "Creating Adult and Child Prices 👨‍👧"
  DayPass.create!(
    adult_price: rand(89..129),
    child_price: rand(39..69),
    listing_id: index + 1
  )
end

puts "Seeding the reviews 🌱"
20.times do |index|
  rand(1..50).times do
    Review.create!(
      title: Faker::Marketing.buzzwords,
      content: Faker::Restaurant.review,
      rating: rand(3..5),
      user_id: rand(2..21),
      listing_id: index + 1
    )
  end
end


puts "Seeding Done"
