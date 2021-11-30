# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB"
Listing.destroy_all
User.destroy_all

puts "Creating the dummy hotel partner"
User.create!(email: "test@test.com", password: "12345678!", hotel_partner: true)

puts "Seeding the listing"

20.times do
  puts "Creating the listing"
  city = Faker::Nation.capital_city
  Listing.create!(
    name: "#{city} Hotel",
    address: Faker::Address.street_address,
    details: Faker::Lorem.paragraph(sentence_count: 10),
    city: city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    user_id: 1
  )
end

puts "Seeding the Daypasses"

20.times do |index|
  puts "Creating Adult Prices"
  DayPass.create!(
    name: "Adult",
    price: rand(89..129),
    daypass_type: "Day Pass",
    listing_id: index + 1
  )
  puts "Creating Child Prices"
  DayPass.create!(
    name: "Child",
    price: rand(39..69),
    daypass_type: "Day Pass",
    listing_id: index + 1
  )
end


puts "Seeding Done"
