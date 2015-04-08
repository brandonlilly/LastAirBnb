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
HomeType.destroy_all
Review.destroy_all

toph =    User.create!(name: 'Toph Beifong', email: 'toph', password: 'password');
asami =   User.create!(name: 'Asami Sato', email: 'asami', password: 'password');
bolin =   User.create!(name: 'Bolin', email: 'bolin', password: 'password');
iroh =    User.create!(name: 'Iroh', email: 'iroh', password: 'password');

brandon = User.create!(name: 'Brandon', email: 'brandon', password: 'brandon');

house =       HomeType.create!(name: "House")
earth_house = HomeType.create!(name: "Earth House")
HomeType.create!(name: "Villa")
HomeType.create!(name: "Castle")
HomeType.create!(name: "Mansion")
HomeType.create!(name: "Loft")
HomeType.create!(name: "Cave")

hole = toph.listings.create!(
  title: 'Dirt Hole',
  price: 20,
  address: 'Dirt Street',
  description: 'A hole in the ground',
  capacity: 1,
  beds: 0,
  bedrooms: 0,
  bathrooms: 0,
  home_type_id: earth_house.id
)

mansion = toph.listings.create!(
  title: 'Beifong Mansion',
  price: 4000,
  address: 'Gaoling, Southern Earth Kingdom',
  description: 'Home of the wealthiest Earth Kingdom family',
  capacity: 18,
  beds: 18,
  bedrooms: 12,
  bathrooms: 6,
  home_type_id: house.id
)

kitchen = Amenity.create!(name: 'Kitchen', description: 'Space where guests can cook their own meals')
heating = Amenity.create!(name: 'Heating', description: 'Central heating or heating in the listing')
essentials = Amenity.create!(name: 'Essentials', description: 'Towels, bed sheets, soap, and toilet paper')

mansion.reviews.create!(body: 'Well maintained. I had a lovely time.', rating: 5, user: asami);
mansion.reviews.create!(body: 'Really great!', rating: 5, user: bolin);
mansion.reviews.create!(body: 'I loved the tea!', rating: 5, user: iroh);

mansion.listing_amenities.create!(amenity: kitchen)
mansion.listing_amenities.create!(amenity: heating)
mansion.listing_amenities.create!(amenity: essentials)
hole.listing_amenities.create!(amenity: heating)
