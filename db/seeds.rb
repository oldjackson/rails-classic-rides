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

makes = %w(Ford Ferrari Fiat Alpine Chevrolet Nissan Jaguar Alfa\ Romeo Mercedes-Benz BMW Mercedes-Benz Alfa Ferrari Dodge Lancia Maserati Ford Citroën De\ Tomaso Ford Porsche)
models = %w(Mustang\ GT Testarossa Dino\ Coupé A110 Corvette 280Z E-type Giulia\ GT\ Junior 280SL 507 300SL Giulia\ TI\ Super 365\ Daytona Charger\ RT Aurelia\ B24 Ghibli GT40 DS Pantera Mustang\ Fastback 356)
years = [1968, 1986, 1977, 1970, 1978, 1976, 1962, 1966, 1970, 1959, 1956, 1972, 1970, 1969, 1962, 1971, 1966, 1960, 1972, 1965, 1962]
number_seats = [4, 2, 4, 2, 2, 4, 2, 4, 2, 2, 2, 5, 2, 4, 2, 4, 2, 5, 2, 4, 4]
description = ["Your muscle car of choice",\
  "An iconic 1980s classic",\
  "When Fiat meets Ferrari",
  "A frenchy treat",
  "America's all-time sweetheart",
  "When Japan started making handsome cars",
  "An all-time automobile icon",
  "As Alfa as it can get",
  "An everyday, unassumingly gorgeous wagen",
  "Elvis knew his stuff",
  "Fly on gull wings",
  "Pronto polizia?",
  "Not for racing",
  "Also available outside Hazzard",
  "Gassman not included",
  "The real hot wind",
  "The Ferrari squasher",
  "La déesse",
  "An italoamerican feline",
  "A sleek classic",
  "The mother of all Porsches"
]
car_photos_url = ['https://assets.hemmings.com/story_image/605267-1000-0',\
    'https://www.carpixel.net/w/5c43caab635a9852f8319eed532d5d04/ferrari-testarossa-car-wallpaper-70775.jpg',\
    'https://www.classicdriver.com/sites/default/files/cars_images/113_1_1.jpg',\
    'https://rmsothebys-cache.azureedge.net/5/1/b/1/2/d/51b12dc834603e3992f790679c7941a76dca3852.jpg',\
    'http://capefearcorvettes.com/wp-content/uploads/2014/03/tion-widescreen-wallpaper-chevrolet-corvette-c3-stingray-1976-chevy-corvette-stingray-c3-chevrolet-corvette-c3-stingray-chevrolet-corvette-stingray-c3-co.jpg',\
    'http://cloudlakes.com/data_images/models/nissan-280z/nissan-280z-01.jpg',\
    'https://www.hagertyinsurance.co.uk/price-guide/Content/VehicleImages/Jaguar%20E%20Type%20S1%20FHC%20front.jpg',\
    'http://car-from-uk.com/ebay/carphotos/full/ebay268631.jpg',\
    'http://classicinvest.com/wp-content/uploads/2012/05/DSCN04453.jpg',\
    'https://rmsothebys-cache.azureedge.net/7/3/c/1/a/c/73c1acfacedfdd8b4ef6a6bc67a48b5645cfd6a2.jpg',\
    'https://rmsothebys-cache.azureedge.net/3/1/b/f/5/5/31bf5550fb49732c2ce4a0db3ef302d2aa1a1d2c.jpg',\
    'https://gammanine.files.wordpress.com/2011/04/dsc_7389-edit.jpg',\
    'https://wallscover.com/images/ferrari-daytona-1.jpg',\
    'http://www.onallcylinders.com/wp-content/uploads/2017/07/20/1969-Dodge-Charger-RT-by-Terry-Shea-Parental-Guidance.jpg',\
    'https://upload.wikimedia.org/wikipedia/commons/9/9a/1957_Lancia_Aurelia_B24_-_red_-_fvl.jpg',\
    'https://blogs-images.forbes.com/hannahelliott/files/2012/01/erez-11.jpeg',\
    'https://www.topgear.com/sites/default/files/styles/16x9_1858w/public/news-listicle/image/le-mans-icon-ford-gt40.jpg?itok=1-O9rh6a',\
    'https://s1.dyler.com/images/posts/1678/images/citroen-ds-19-1960.jpg',\
    'https://img.pistonheads.com/LargeSize/de-tomaso/pantera/de-tomaso-pantera-S2314059-1.jpg',\
    'https://upload.wikimedia.org/wikipedia/commons/5/50/1965_Ford_Mustang_Fastback_%2815595256971%29.jpg',\
    'https://images.unsplash.com/photo-1498946168008-9b2e06e76ea0?ixlib=rb-0.3.5&s=25f0250733908eb56e99c20f4bafa866&auto=format&fit=crop&w=750&q=80',\
]


cars = []

locations = ["Rome", "Lisbon", "London", "Milan", "Madrid", "Rome", "Lisbon", "London", "Milan", "Madrid", "Rome", "Lisbon", "London", "Milan", "Madrid", "Rome", "Lisbon", "London", "Milan", "Madrid", "Rome"]


(0...21).each do |i|

  car = Car.new(
    make: makes[i],
    model: models[i],
    year: years[i],
    location: locations[i],
    price_day: rand(400..700),
    number_seats: number_seats[i],
    description: description[i],

    user: users.sample
  )
  car.car_photos = [CarPhoto.create(remote_photo_url: car_photos_url[i])]
  cars << car
  car.save!
end

6.times do
  user = users.sample
  other_cars = cars.reject{ |car| car.user == user }
  other_car = other_cars.sample
  start_date = Faker::Date.forward(365)
  days = (0..6).to_a.sample
  booking = Booking.new(
    user: user,
    car: other_car,
    start_date: start_date,
    end_date: start_date + days,
    total_price: (days + 1) * other_car.price_day
  )
  booking.save!
end
