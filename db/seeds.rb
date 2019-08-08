# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# 10.times do
#   City.create(city_name: Faker::Address.unique.city, zip_code: Faker::Address.zip)
# end

# 10.times do
#    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, desctiption: Faker::Movies::Lebowski.quote, email: Faker::Internet.email, age: rand(17..50),city: City.find(rand(1..10)))
# end

# 10.times do
# hash_tag = "#" + Faker::Lorem.unique.word
#   Tag.create(content: hash_tag)
# end

# 20.times do
#   Gossip.create!(title: Faker::Game.title,content: Faker::Movie.quote,user: User.find(rand(1..10)))
# end
# Gossip.all.each do |gossip|
#   rand(1..3).times do
#     begin
#       my_selected_tag = Tag.find(rand(1..10))
#     end while gossip.tags.include?(my_selected_tag)
#     gossip.tags << my_selected_tag
#   end
# end


# 30.times do
#   PrivateMessage.create(sender: User.find(rand(2..10)),content: Faker::Movies::Lebowski.quote)
# end
PrivateMessage.all.each do |pm|
    rand(1..3).times do
    begin
      my_selected_recipient = User.find(rand(1..10))
    end while pm.recipients.include?(my_selected_recipient) && my_selected_recipient == pm.sender
    pm.recipients << my_selected_recipient
  end
end