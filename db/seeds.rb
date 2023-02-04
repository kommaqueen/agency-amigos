# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting all old celebz"
Celebrity.destroy_all

user1 = User.create!(
  first_name: "Caio",
  last_name: "Zimbardi",
  email: "cbzimbardi@gmail.com",
  password: "123456",
  age: 31
)

3.times do
  celebrity = Celebrity.new(
    name: Faker::FunnyName.two_word_name,
    category: Faker::Job.field,
    daily_rate: Faker::Number.between(from: 1, to: 200),
    rating: rand(0..5),
    description: Faker::Hipster.paragraph
  )
  celebrity.user = user1
  celebrity.save!
  puts "Celebrity with id #{celebrity.id} has been created"
end

user2 = User.create!(
  first_name: "Lucy",
  last_name: "Treganna",
  email: "lucy@gmail.com",
  password: "123456",
  age: 30
)

3.times do
  celebrity = Celebrity.new(
    name: Faker::FunnyName.two_word_name,
    category: Faker::Job.field,
    daily_rate: Faker::Number.between(from: 1, to: 200),
    rating: rand(0..5),
    description: Faker::Hipster.paragraph
  )
  celebrity.user = user2
  celebrity.save!
  puts "Celebrity with id #{celebrity.id} has been created"
end

user3 = User.create!(
  first_name: "Deanna",
  last_name: "Wright",
  email: "deanna@gmail.com",
  password: "123456",
  age: 31
)

3.times do
  celebrity = Celebrity.new(
    name: Faker::FunnyName.two_word_name,
    category: Faker::Job.field,
    daily_rate: Faker::Number.between(from: 1, to: 200),
    rating: rand(0..5),
    description: Faker::Hipster.paragraph
  )
  celebrity.user = user3
  celebrity.save!
  puts "Celebrity with id #{celebrity.id} has been created"
end

puts "Done!"
