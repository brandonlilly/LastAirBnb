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
Photo.destroy_all

toph =    User.create!(name: 'Toph Beifong', email: 'toph', password: 'password');
suyin =   User.create!(name: 'Suyin Beifong', email: 'suyin', password: 'password');
lin =     User.create!(name: 'Lin Beifong', email: 'lin', password: 'password');
asami =   User.create!(name: 'Asami Sato', email: 'asami', password: 'password');
hiroshi = User.create!(name: 'Hiroshi Sato', email: 'hiroshi', password: 'password');
korra =   User.create!(name: 'Korra', email: 'korra', password: 'password');
senna =   User.create!(name: 'Senna', email: 'senna', password: 'password');
mako =    User.create!(name: 'Mako', email: 'mako', password: 'password');
bolin =   User.create!(name: 'Bolin', email: 'bolin', password: 'password');
pema =    User.create!(name: 'Pema', email: 'pema', password: 'password');
tenzin =  User.create!(name: 'Tenzin', email: 'tenzin', password: 'password');
iroh =    User.create!(name: 'Iroh', email: 'iroh', password: 'password');
ozai =    User.create!(name: 'Ozai', email: 'ozai', password: 'password');
aiwei =   User.create!(name: 'Aiwei', email: 'aiwei', password: 'password');
hua =     User.create!(name: 'Hua', email: 'hua', password: 'password');
gommu =   User.create!(name: 'Gommu', email: 'gommu', password: 'password');

brandon = User.create!(name: 'Brandon', email: 'brandon', password: 'brandon');

house =       HomeType.create!(name: "House")
earth_house = HomeType.create!(name: "Earth House")
temple = HomeType.create!(name: "Temple")
inn = HomeType.create!(name: "Inn")
apartment = HomeType.create!(name: "Apartment")
tent = HomeType.create!(name: "Tent")
HomeType.create!(name: "Villa")
HomeType.create!(name: "Castle")
HomeType.create!(name: "Mansion")
HomeType.create!(name: "Loft")
HomeType.create!(name: "Cave")

kitchen = Amenity.create!(name: 'Kitchen', description: 'Space where guests can cook their own meals')
heating = Amenity.create!(name: 'Heating', description: 'Central heating or heating in the listing')
essentials = Amenity.create!(name: 'Essentials', description: 'Towels, bed sheets, soap, and toilet paper')
pool = Amenity.create!(name: 'Pool', description: 'Pool for guests to swim in')

hole = toph.listings.create!(
  title: 'Snug Earthy Home',
  price: 34,
  address: 'Foggy Swamp',
  description: 'A simple place built into tree roots. One bed and plenty of mud to soak your feet in.',
  capacity: 1,
  beds: 0,
  bedrooms: 0,
  bathrooms: 0,
  home_type_id: earth_house.id,
  lat: -5.134714634014442,
  lng: 57.70912170410156
)
cover = hole.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earthy-home/outside-view.jpg')
hole.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earthy-home/toph-room.jpg')
hole.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earthy-home/toph-overhead.jpg')
hole.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earthy-home/toph-bed.jpg')
hole.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earthy-home/fireplace.jpg')
hole.update!(cover_photo_id: cover.id)
hole.listing_amenities.create!(amenity: heating)


sato_estate = asami.listings.create!(
  title: 'Sato Estate',
  price: 6500,
  address: 'Republic City, United Republic of Nations',
  description: 'Sato family estate.',
  capacity: 18,
  beds: 18,
  bedrooms: 12,
  bathrooms: 6,
  home_type_id: house.id,
  lat: 41.508577297439324,
  lng: 8.580322265625
)
cover = sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/bird-view.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/front-steps.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/front-view.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/pool-1.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/pool-2.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/pool-3.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/side-view.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/stairway.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/hall.jpg')
sato_estate.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/sato-mansion/racetrack.jpg')
sato_estate.update!(cover_photo_id: cover.id)
sato_estate.listing_amenities.create!(amenity: kitchen)
sato_estate.listing_amenities.create!(amenity: heating)
sato_estate.listing_amenities.create!(amenity: essentials)
sato_estate.listing_amenities.create!(amenity: pool)
sato_estate.reviews.create!(body: 'Well maintained. I had a lovely time.', rating: 5, user: mako);
sato_estate.reviews.create!(body: 'The servants called me Master Bolin! Best place ever!', rating: 5, user: bolin);
sato_estate.reviews.create!(body: 'I loved the tea!', rating: 5, user: iroh);


aiwei_house = aiwei.listings.create!(
  title: 'Quiet Zaofu Home',
  price: 740,
  address: 'Zaofu, Earth Kingdom',
  description: "My personal home. Comfortable living space in a quiet, secluded part of the city. Just don't go poking around",
  capacity: 2,
  beds: 1,
  bedrooms: 1,
  bathrooms: 1,
  home_type_id: house.id,
  lat: -10.01212955790814,
  lng: 51.01226806640625
)
cover = aiwei_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/aiwei-house/overlook.jpg')
aiwei_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/aiwei-house/front-room.jpg')
aiwei_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/aiwei-house/room-shot.jpg')
aiwei_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/aiwei-house/bird-view.jpg')
aiwei_house.update!(cover_photo_id: cover.id)
aiwei_house.listing_amenities.create!(amenity: kitchen)
aiwei_house.listing_amenities.create!(amenity: heating)
aiwei_house.listing_amenities.create!(amenity: essentials)


misty_palms = hua.listings.create!(
  title: 'Misty Palms Inn',
  price: 200,
  address: 'Misty Palms Oasis, Si Wong Desert',
  description: "A refreshing oasis in the dry desert. Come relax in our pool, and sleep in our warm beds.",
  capacity: 1,
  beds: 1,
  bedrooms: 1,
  bathrooms: 1,
  home_type_id: inn.id,
  lat: -5.266007882805485,
  lng: 72.52761840820312
)
cover = misty_palms.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/misty-palms-inn/court.jpg')
misty_palms.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/misty-palms-inn/room.jpg')
misty_palms.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/misty-palms-inn/bird-view.jpg')
misty_palms.update!(cover_photo_id: cover.id)
misty_palms.listing_amenities.create!(amenity: heating)
misty_palms.listing_amenities.create!(amenity: essentials)
misty_palms.listing_amenities.create!(amenity: pool)

lin_aparment = lin.listings.create!(
  title: 'Comfortable Apartment',
  price: 450,
  address: 'Republic City, United Republic of Nations',
  description: "I'm hardly home anymore so may as well rent the place out. It's a good place with a great view of the city and in a convenient location. Tastefully decorated. You'll love it, I'm sure.",
  capacity: 1,
  beds: 1,
  bedrooms: 1,
  bathrooms: 1,
  home_type_id: inn.id,
  lat: 44.08758502824518,
  lng: 0.984649658203125
)
cover = lin_aparment.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/lin-apartment/lin-room-1.jpg')
lin_aparment.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/lin-apartment/lin-room-2.jpg')
lin_aparment.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/lin-apartment/lin-room-3.jpg')
lin_aparment.update!(cover_photo_id: cover.id)
lin_aparment.listing_amenities.create!(amenity: heating)
lin_aparment.listing_amenities.create!(amenity: essentials)


slum = gommu.listings.create!(
  title: 'Underground Refuge',
  price: 10,
  address: 'Republic City Sewers',
  description: "It's not a king's living quarters but plenty good for sleeping. Plus lots of friendly people around to keep you company. We all get along down here!",
  capacity: 1,
  beds: 0,
  bedrooms: 0,
  bathrooms: 0,
  home_type_id: tent.id,
  lat: 44.465151013519616,
  lng: 6.9962310791015625
)
cover = slum.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/slum/slums2.jpg')
slum.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/slum/slums1.jpg')
slum.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/slum/slums3.jpg')
slum.update!(cover_photo_id: cover.id)

lovely_home = pema.listings.create!(
  title: 'Lovely Home',
  price: 295,
  address: 'Air Temple Island, Republic City',
  description: "Beautiful house on Air Temple Island. You can visit the Air Temple and Academy. There isn't a more comfortable home but you'll have to ferry to get to the city.",
  capacity: 3,
  beds: 2,
  bedrooms: 2,
  bathrooms: 1,
  home_type_id: house.id,
  lat: 40.3130432088809,
  lng: 2.9972076416015625
)
cover = lovely_home.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/lovely-home/outside-view.jpg')
lovely_home.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/lovely-home/room-1.jpg')
lovely_home.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/lovely-home/room-2.jpg')
lovely_home.update!(cover_photo_id: cover.id)
lovely_home.listing_amenities.create!(amenity: kitchen)
lovely_home.listing_amenities.create!(amenity: heating)
lovely_home.listing_amenities.create!(amenity: essentials)

cozy_igloo = pema.listings.create!(
  title: 'Cozy Igloo',
  price: 245,
  address: 'Harbor City, Southern Water Tribe',
  description: "Nice and cozy home. Very traditional water tribe decor. You'll have no trouble staying warm here.",
  capacity: 3,
  beds: 3,
  bedrooms: 2,
  bathrooms: 1,
  home_type_id: house.id,
  lat: -60.15244221438077,
  lng: -4.09515380859375
)
cover = cozy_igloo.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/cozy-igloo/outside-night.jpg')
cozy_igloo.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/cozy-igloo/outside-front.jpg')
cozy_igloo.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/cozy-igloo/kitchen.jpg')
cozy_igloo.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/cozy-igloo/outside-day.jpg')
cozy_igloo.update!(cover_photo_id: cover.id)
cozy_igloo.listing_amenities.create!(amenity: kitchen)
cozy_igloo.listing_amenities.create!(amenity: heating)
cozy_igloo.listing_amenities.create!(amenity: essentials)

bhanti_temple = pema.listings.create!(
  title: 'Bhanti Village Temple',
  price: 460,
  address: 'Bhanti Island, Fire Nation',
  description: "Open to all travellers. Respect what is sacred and your stay will be a pleasant one.",
  capacity: 8,
  beds: 8,
  bedrooms: 4,
  bathrooms: 2,
  home_type_id: temple.id,
  lat: -13.539200668930802,
  lng: -48.91937255859375
)
cover = bhanti_temple.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/bhanti-temple/outside-view.jpg')
bhanti_temple.update!(cover_photo_id: cover.id)
bhanti_temple.listing_amenities.create!(amenity: heating)
bhanti_temple.listing_amenities.create!(amenity: essentials)


air_temple = tenzin.listings.create!(
  title: 'Southern Air Temple',
  price: 520,
  address: 'Patola Mountain Range',
  description: 'Birthplace of Aang, one of the original four Air Nomad Temples. Destroyed in the Hundred Year War and recently restored by air acolytes.',
  capacity: 4,
  beds: 4,
  bedrooms: 2,
  bathrooms: 2,
  home_type_id: temple.id,
  lat: -47.42808726171425,
  lng: 8.47320556640625
)
# need to convert to jpg
cover = air_temple.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/southern-air-temple/outside-view.png')
air_temple.update!(cover_photo_id: cover.id)
air_temple.listing_amenities.create!(amenity: heating)
air_temple.listing_amenities.create!(amenity: essentials)
air_temple.reviews.create!(body: 'I had a very peaceful stay.', rating: 5, user: korra);


ember_island = ozai.listings.create!(
  title: "Quaint Beach House",
  price: 1100,
  address: 'Ember Island, Fire Nation',
  description: 'Great for family vacations. Beautiful beaches to get away and relax. Plenty of day and nightime activities.',
  capacity: 4,
  beds: 4,
  bedrooms: 3,
  bathrooms: 2,
  home_type_id: house.id,
  lat: 12.597454504832017,
  lng: -44.674530029296875
)
cover = ember_island.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/beach-house/outside-view.png')
ember_island.update!(cover_photo_id: cover.id)
ember_island.listing_amenities.create!(amenity: heating)
ember_island.listing_amenities.create!(amenity: essentials)
ember_island.listing_amenities.create!(amenity: kitchen)

# mansion = toph.listings.create!(
#   title: 'Beifong Mansion',
#   price: 4000,
#   address: 'Gaoling, Southern Earth Kingdom',
#   description: 'Home of the wealthiest Earth Kingdom family',
#   capacity: 18,
#   beds: 18,
#   bedrooms: 12,
#   bathrooms: 6,
#   home_type_id: house.id,
#   lat: 37.8,
#   lng: -122.5
# )
#
