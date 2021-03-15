# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
    id: 1,
    username: "Admin1",
    email: "admin1@admin.com",
    password: "1234567",
    password_confirmation: "1234567",
    admin: true
  )
  user.save!

  user = User.new(
    id: 2,
    username: "Admin2",
    email: "admin2@admin.com",
    password: "1234567",
    password_confirmation: "1234567",
    admin: true
  )
  user.save!

  user = User.new(
    id: 3,
    username: "James",
    email: "james@example.com",
    password: "password123",
    password_confirmation: "password123"
  )
  user.save!
  
  # Listing.create!([{
  #   title: "Exercise Bands",
  #   description: "Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.",
  #   condition: "Excellent",
  #   price: "20",
  #   listing_type: "Misc",
  #   image: Rails.root.join("app/assets/images/bands.jpg").open,
  #   user_id: user.id
  # },
  # {
  #   title: "20kg Dumbbell",
  #   description: "Hello and thank you for looking at my Item. We are proud to present this stunning 2018 Gibson Les Paul Standard in Bourbon Burst in 100% Mint/Unplayed condition! The 2017 LP Standards are extremely nice,  with a super comfortable necks, and awesome bold finishes.  This Bourbon Burst finish is absolutely stunning! The tone that comes out of this monster is everything you would expect from a Les Paul Standard!! The guitar sounds awesome and has that famous Les Paul  Tone.  Very easy to play with a nice comfortable standard neck featuring a compound radius fret board which means shredding speed is easier on a Gibson! This is one great guitar for the money!  Will  ship via Fed Ex Ground or Home Delivery in Brand New Gibson case with pictured case candy insured for full purchase price!",
  #   condition: "Used",
  #   price: "30",
  #   listing_type: "Strength",
  #   image: Rails.root.join("app/assets/images/db.jpg",
  #   user_id: user.id
  # }])


  
  

  