# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []

100.times do
  first_name =  Faker::Name.first_name
  user = User.new(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(),
    password: "xxxxxx"
  )
  users << user
  user.save!
end

makes = %w(Ford Ferrari Fiat Renault Chevrolet Nissan Jaguar Alfa\ Romeo Mercedes-Benz BMW)
models = %w(Mustang\ GT Testarossa Dino\ Coupé Alpine Corvette 280Z E-type Giulia\ GT\ Junior 280SL 507)
years = [1968, 1986, 1977, 1970, 1978, 1976, 1962, 1966, 1970, 1959]
number_seats = [4, 2, 4, 2, 2, 4, 2, 4, 2, 2]
description = ["Your muscle car of choice",\
  "An iconic 1980s classic",\
  "When Fiat meets Ferrari",
  "A frenchy treat",
  "America's all-time sweetheart",
  "When Japan started making handsome cars",
  "An all-time automobile icon",
  "As Alfa as it can get",
  "An everyday, unassumingly gorgeous wagen",
  "Elvis knew his stuff"
]

(0...10).each do |i|
  car = Car.new(
    make: makes[i],
    model: models[i],
    year: years[i],
    price_day: rand(400..700),
    number_seats: number_seats[i],
    description: description[i],
    location: Faker::Address.city,
    user: users.sample
  )
  car.save!
end
