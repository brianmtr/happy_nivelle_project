require 'faker'
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
  password = Faker::Lorem.characters(number: 10)
  User.create firstname:              Faker::Name.name,
              lastname:               Faker::Name.name,
              email:                  Faker::Internet.email,
              password:               password,
              password_confirmation:  password
end
​
(1..5).each do |_number|
  @user = User.all.sample
  @user.update_attribute(:admin, 'true')
end
​ 
# creation des events en attibuant un user, et un nombre de tag à chaque.
(1..50).each do |_number|
  @event = Event.new  title:        Faker::Lorem.sentence,
                      description:  Faker::Lorem.paragraph(sentence_count: 3),
                      address:      Faker::Address.full_address,
                      status:       rand(0..2),
                      date:         Faker::Date.between(from: 2.month.ago, to: 2.month.from_now)
  # @event.image_data.attach(io: File.open("#{Rails.root}/public/smiley-2403201_1920.png"), filename: 'image.png', content_type: 'image/png')
  @event.save
end