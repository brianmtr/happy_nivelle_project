# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# delete all entries for moment, i don't use environnement


# create 10 users
(1..10).each do |_number|
  User.create firstname:   Faker::Name.name,
              lastname:   Faker::Name.name,
              email:  Faker::Internet.email,
              password: Faker::Lorem.characters(number: 10),
              password_confirmation: Faker::Lorem.characters(number: 10)
    @user = User.all.sample
    @users = User.all.shuffle
    @users.each {|u| u.update_attribute(admin: true) }
end




# creation des events en attibuant un user, et un nombre de tag à chaque.
(1..10).each do |_number|
  @event = Event.create title:        Faker::Lorem.sentence,
                        description:      Faker::Lorem.paragraph(sentence_count: 3),
                        address:        Faker::Address.full_address,
                        status:        Faker::Number.between(from: 0, to: 2),
                        date:        Faker::Date.between(from: 2.month.ago, to: 2.month.from_now)
end
