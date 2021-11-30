# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB"
Listing.destroy_all

puts "Seeding the listing"

20.times do
  puts "Creating the listing
  "
  Listing.create!(
    name: "#{Faker::Nation.capital_city} Hotel",
    address: Faker::Address.street_address,
    details: Faker::Lorem.paragraph(sentence_count: 10),
    city_state: Faker::Nation.capital_city,
    user_id: 1
  )
end

puts "Seeding Done"
