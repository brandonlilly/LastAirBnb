# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Listing.destroy_all
Amenity.destroy_all
ListingAmenity.destroy_all

toph = User.create!(name: 'Toph Beifong', email: 'toph', password: 'password');
brandon = User.create!(name: 'Brandon', email: 'brandon', password: 'brandon');

hole = toph.listings.create!(title: 'Dirt Hole', price: 20, capacity: 1, address: 'dirt street', description: 'its a hole in the ground')
mansion = toph.listings.create!(title: 'Beifong Mansion', price: 4000, capacity: 12, address: 'earth village', description: 'Home of the richest earth kingdom family')

kitchen = Amenity.create!(name: 'kitchen', description: 'space where guests can cook their own meals')
heating = Amenity.create!(name: 'heating', description: 'central heating or heating in the listing')
essentials = Amenity.create!(name: 'essentials', description: 'Towels, bed sheets, soap, and toilet paper')

mansion.listing_amenities.create!(amenity: kitchen)
mansion.listing_amenities.create!(amenity: heating)
mansion.listing_amenities.create!(amenity: essentials)
hole.listing_amenities.create!(amenity: heating)
