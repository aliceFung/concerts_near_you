# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MULTIPLIER = 10

# User.destroy_all
Location.destroy_all
Artist.destroy_all
Favorite.destroy_all


MULTIPLIER.times do |i|
  User.create( email: "email#{i}.gmail.com",
                password: "password"
                password_confirmation: "password")
  Artist.create (name: "artist#{i}")
end

users = User.all
artists = Artist.all

# MULTIPLIER.times do |i|