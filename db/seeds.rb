# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new(
    id: 95,
    username: "Admin1",
    email: "admin1@admin.com",
    password: "1234567",
    password_confirmation: "1234567",
    admin: true
  )
  user.save!

  user = User.new(
    id: 96,
    username: "Admin2",
    email: "admin2@admin.com",
    password: "1234567",
    password_confirmation: "1234567",
    admin: true
  )
  user.save!

  user = User.new(
    id: 97,
    username: "James",
    email: "james@example.com",
    password: "password123",
    password_confirmation: "password123"
  )
  user.save!

  boxing_gloves_2 = Listing.new(title: "Everlast Boxing gloves",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Mint",
    price: "15",
    listing_type: "Boxing",
    user_id: user.id)

    boxing_gloves_2.image.attach(io: File.open('app/assets/images/boxing_gloves_2.jpg'), filename: ' boxing_gloves_2.jpg')
    boxing_gloves_2.save
  
  resistance_band = Listing.new(title: "Resistance Bands",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Excellent",
    price: "15",
    listing_type: "Misc",
    user_id: user.id)

    resistance_band.image.attach(io: File.open('app/assets/images/res_bands.jpg'), filename: 'res_bands.jpg')
    resistance_band.save

  barbell = Listing.new(title: "12kg Barbell",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Used",
    price: "15",
    listing_type: "Strength",
    user_id: user.id)

    barbell.image.attach(io: File.open('app/assets/images/barbell.jpg'), filename: 'barbell.jpg')
    barbell.save

    user = User.new(
      id: 98,
      username: "Kane",
      email: "kane@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    user.save!

  boxing_gloves = Listing.new(title: "Boxing gloves",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Used",
    price: "12",
    listing_type: "Boxing",
    user_id: user.id)

    boxing_gloves.image.attach(io: File.open('app/assets/images/boxing_gloves.jpg'), filename: ' boxing_gloves.jpg')
    boxing_gloves.save

  dumbell = Listing.new(title: "Pair of 12kg Dumbells",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Fair",
    price: "20",
    listing_type: "Strength",
    user_id: user.id)

    dumbell.image.attach(io: File.open('app/assets/images/dumbell.jpg'), filename: 'dumbell.jpg')
    dumbell.save

  ez_curl_bar = Listing.new(title: "12kg Ez Curl Bar",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Fair",
    price: "22",
    listing_type: "Strength",
    user_id: user.id)

    ez_curl_bar.image.attach(io: File.open('app/assets/images/ez_curl_bar.jpg'), filename: 'ez_curl_bar.jpg')
    ez_curl_bar.save

    user = User.new(
      id: 99,
      username: "Kelly",
      email: "kelly@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    user.save!

  medicine_ball = Listing.new(title: "5kg Medicine Ball",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Mint",
    price: "30",
    listing_type: "Misc",
    user_id: user.id)

    medicine_ball.image.attach(io: File.open('app/assets/images/medicine_ball.jpg'), filename: 'medicine_ball.jpg')
    medicine_ball.save

  sparing_gloves = Listing.new(title: "Red/White Sparing Gloves",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Mint",
    price: "18",
    listing_type: "Boxing",
    user_id: user.id)

    sparing_gloves.image.attach(io: File.open('app/assets/images/sparing_gloves.jpg'), filename: 'sparing_gloves.jpg')
    sparing_gloves.save

  tricep_bar = Listing.new(title: "12 kg Tricep Bar",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Used",
    price: "17",
    listing_type: "Strength",
    user_id: user.id)

    tricep_bar.image.attach(io: File.open('app/assets/images/tricep_bar.jpg'), filename: ' tricep_bar.jpg')
    tricep_bar.save

    user = User.new(
      id: 100,
      username: "Mitch",
      email: "mitch@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    user.save!

  treadmill = Listing.new(title: "Treadmill",
    description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
    condition: "Mint",
    price: "50",
    listing_type: "Cardio",
    user_id: user.id)

    treadmill.image.attach(io: File.open('app/assets/images/treadmill.jpg'), filename: ' treadmill.jpg')
    treadmill.save
  