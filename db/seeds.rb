# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all if User.all.size.positive?

(1..10).each do |_number|
    User.create firstname:   Faker::Name.firstname,
                lastname:    Faker::Name.lastname,
                email:       Faker::Internet.email
            
 
end

Event.delete_all     if Event.all.size.positive?

  (1..10).each do |_number|
    Event.create title:         Faker::Name.title,
                 address:       Faker::Address.address,
                 description:   Faker::Internet.description
                 
                 
  end