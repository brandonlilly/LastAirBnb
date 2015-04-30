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
tonraq =  User.create!(name: 'Tonraq', email: 'tonraq', password: 'password');
mako =    User.create!(name: 'Mako', email: 'mako', password: 'password');
bolin =   User.create!(name: 'Bolin', email: 'bolin', password: 'password');
yin =     User.create!(name: 'Yin', email: 'yin', password: 'password');
pema =    User.create!(name: 'Pema', email: 'pema', password: 'password');
tenzin =  User.create!(name: 'Tenzin', email: 'tenzin', password: 'password');
iroh =    User.create!(name: 'Iroh', email: 'iroh', password: 'password');
ozai =    User.create!(name: 'Ozai', email: 'ozai', password: 'password');
aiwei =   User.create!(name: 'Aiwei', email: 'aiwei', password: 'password');
hua =     User.create!(name: 'Hua', email: 'hua', password: 'password');
gommu =   User.create!(name: 'Gommu', email: 'gommu', password: 'password');
houting = User.create!(name: 'Hou-Ting', email: 'houting', password: 'password');
hatoa =   User.create!(name: 'Hatoa', email: 'hatoa', password: 'password');
tarrlok = User.create!(name: 'Tarrlok', email: 'tarrlok', password: 'password');
hongli =  User.create!(name: 'Hong Li', email: 'hongli', password: 'password');
poe =     User.create!(name: 'Poe', email: 'poe', password: 'password');
ming =    User.create!(name: 'Ming', email: 'ming', password: 'password');

brandon = User.create!(name: 'Brandon', email: 'brandon', password: 'brandon');

house = HomeType.create!(name: "House")
earth_house = HomeType.create!(name: "Earth House")
temple = HomeType.create!(name: "Temple")
inn = HomeType.create!(name: "Inn")
apartment = HomeType.create!(name: "Apartment")
tent = HomeType.create!(name: "Tent")
palace = HomeType.create!(name: "Palace")
commune = HomeType.create!(name: "Commune")
estate = HomeType.create!(name: "Estate")
hotel = HomeType.create!(name: "Hotel")
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
  home_type_id: estate.id,
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
  lat: -9.40571004160001,
  lng: 49.588165283203125
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
  lat: 45.1510532655634,
  lng: 5.071563720703125
)
cover = slum.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/slum/slums1.jpg')
slum.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/slum/slums2.jpg')
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
  lat: -42.553080288955805,
  lng: -2.8125
)
cover = air_temple.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/southern-air-temple/outside-view.jpg')
air_temple.update!(cover_photo_id: cover.id)
air_temple.listing_amenities.create!(amenity: heating)
air_temple.listing_amenities.create!(amenity: essentials)
air_temple.reviews.create!(body: 'I had a very peaceful stay.', rating: 5, user: korra);


royal_palace = tonraq.listings.create!(
  title: 'Royal Palace',
  price: 3610,
  address: 'Harbor City, Southern Water Tribe',
  description: 'Seat of the Southern Water Tribe government.',
  capacity: 12,
  beds: 12,
  bedrooms: 7,
  bathrooms: 3,
  home_type_id: palace.id,
  lat: -60.37042901631508,
  lng: -3.21624755859375
)
cover = royal_palace.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/ice-palace/palace-outside.jpg')
royal_palace.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/ice-palace/lanterns.jpg')
royal_palace.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/ice-palace/entrance.jpg')
royal_palace.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/ice-palace/throne-side.jpg')
royal_palace.update!(cover_photo_id: cover.id)
royal_palace.listing_amenities.create!(amenity: heating)
royal_palace.listing_amenities.create!(amenity: kitchen)
royal_palace.listing_amenities.create!(amenity: essentials)
royal_palace.reviews.create!(body: 'Much better place to stay now that Unaloq is gone.', rating: 4, user: korra);


cousin_house = yin.listings.create!(
  title: 'Comfy Communal Living',
  price: 120,
  address: 'Ba Sing Se, Earth Kingdom',
  description: 'This was the home of our family for over 60 years!',
  capacity: 5,
  beds: 5,
  bedrooms: 2,
  bathrooms: 2,
  home_type_id: commune.id,
  lat: 46.92025531537451,
  lng: 98.4210205078125
)
cover = cousin_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/cousin-house/side-windows.jpg')
cousin_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/cousin-house/common.jpg')
cousin_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/cousin-house/path.jpg')
cousin_house.update!(cover_photo_id: cover.id)
cousin_house.listing_amenities.create!(amenity: heating)
cousin_house.listing_amenities.create!(amenity: essentials)
cousin_house.reviews.create!(body: 'The people here are the best!', rating: 5, user: bolin);
cousin_house.reviews.create!(body: 'I enjoyed my stay here.', rating: 4, user: mako);


earth_palace = houting.listings.create!(
  title: 'Earth Palace',
  price: 3200,
  address: 'Ba Sing Se, Earth Kingdom',
  description: 'Seat of the Earth Kingdom government.',
  capacity: 14,
  beds: 14,
  bedrooms: 10,
  bathrooms: 4,
  home_type_id: palace.id,
  lat: 47.398349200359256,
  lng: 94.86968994140625
)
cover = earth_palace.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earth-palace/front.jpg')
earth_palace.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earth-palace/bird-view.jpg')
earth_palace.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earth-palace/throne-overhead.jpg')
earth_palace.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/earth-palace/throne-room.jpg')
earth_palace.update!(cover_photo_id: cover.id)
earth_palace.listing_amenities.create!(amenity: heating)
earth_palace.listing_amenities.create!(amenity: essentials)
earth_palace.reviews.create!(body: 'This place is the worst! Stay far away from this place, the host is crazy!', rating: 1, user: korra);


earth_guest_house = houting.listings.create!(
  title: 'Palace Guest House',
  price: 1600,
  address: 'Ba Sing Se, Earth Kingdom',
  description: 'Guest house to the Earth Kingdom Royal Palace.',
  capacity: 10,
  beds: 8,
  bedrooms: 6,
  bathrooms: 3,
  home_type_id: house.id,
  lat: 46.31658418182218,
  lng: 95.9600830078125
)
cover = earth_guest_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/guest-home/outside.jpg')
earth_guest_house.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/guest-home/inside.jpg')
earth_guest_house.update!(cover_photo_id: cover.id)
earth_guest_house.listing_amenities.create!(amenity: heating)
earth_guest_house.listing_amenities.create!(amenity: kitchen)
earth_guest_house.listing_amenities.create!(amenity: essentials)
earth_guest_house.reviews.create!(body: "Living here wasn't too bad, but there's always trouble brewing in Ba Sing Se.", rating: 3, user: tenzin);
earth_guest_house.reviews.create!(body: "When the host tries to have you killed, it's a bad sign.", rating: 2, user: asami);


white_lotus = hatoa.listings.create!(
  title: 'White Lotus Compound',
  price: 440,
  address: 'Harbor City, Southern Water Tribe',
  description: 'Headquarters of the Order of the White Lotus. Avatar Korra spent her youth training here.',
  capacity: 8,
  beds: 7,
  bedrooms: 5,
  bathrooms: 3,
  home_type_id: house.id,
  lat: -60.823494332539646,
  lng: -3.04046630859375
)
cover = white_lotus.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/white-lotus/dining.jpg')
white_lotus.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/white-lotus/stables.jpg')
white_lotus.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/white-lotus/bird-view.jpg')
white_lotus.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/white-lotus/grounds-side.jpg')
white_lotus.update!(cover_photo_id: cover.id)
white_lotus.listing_amenities.create!(amenity: heating)
white_lotus.listing_amenities.create!(amenity: kitchen)
white_lotus.listing_amenities.create!(amenity: essentials)
white_lotus.reviews.create!(body: "The host was very hospitable. My family was very comfortable during our stay here.", rating: 5, user: tenzin);


yakone_yurt = tarrlok.listings.create!(
  title: 'Warm Yurt',
  price: 440,
  address: 'Northern Water Tribe',
  description: "A warm place to stay in a quiet village.",
  capacity: 2,
  beds: 2,
  bedrooms: 1,
  bathrooms: 1,
  home_type_id: house.id,
  lat: 65.54936668811527,
  lng: 19.15191650390625
)
cover = yakone_yurt.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/yakone-yurt/side-view.jpg')
yakone_yurt.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/yakone-yurt/inside-view.jpg')
yakone_yurt.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/yakone-yurt/village-view.jpg')
yakone_yurt.update!(cover_photo_id: cover.id)
yakone_yurt.listing_amenities.create!(amenity: heating)
yakone_yurt.listing_amenities.create!(amenity: essentials)


zaofu_apartment = hongli.listings.create!(
  title: 'Small Apartment',
  price: 720,
  address: 'Zaofu, Earth Kingdom',
  description: "Good decorations. Everything is kept clean and tidy. You'll feel right at home! Come and visit Zaofu!",
  capacity: 2,
  beds: 1,
  bedrooms: 1,
  bathrooms: 1,
  home_type_id: apartment.id,
  lat: -7.885147283424318,
  lng: 48.1201171875
)
cover = zaofu_apartment.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/zaofu-apartment/apartment.jpg')
zaofu_apartment.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/zaofu-apartment/kitchen.jpg')
zaofu_apartment.update!(cover_photo_id: cover.id)
zaofu_apartment.listing_amenities.create!(amenity: heating)
zaofu_apartment.listing_amenities.create!(amenity: kitchen)
zaofu_apartment.listing_amenities.create!(amenity: essentials)


zaofu_mansion = suyin.listings.create!(
  title: "Beifong Estate",
  price: 950,
  address: 'Zaofu, Earth Kingdom',
  description: "My husband and I designed and founded Zaofu.",
  capacity: 12,
  beds: 12,
  bedrooms: 8,
  bathrooms: 4,
  home_type_id: estate.id,
  lat: -8.754794702435605,
  lng: 46.845703125
)
cover = zaofu_mansion.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/zaofu-mansion/porch.jpg')
zaofu_mansion.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/zaofu-mansion/main-outside.jpg')
zaofu_mansion.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/zaofu-mansion/zaofu-room.jpg')
zaofu_mansion.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/zaofu-mansion/court.jpg')
zaofu_mansion.update!(cover_photo_id: cover.id)
zaofu_mansion.listing_amenities.create!(amenity: heating)
zaofu_mansion.listing_amenities.create!(amenity: kitchen)
zaofu_mansion.listing_amenities.create!(amenity: essentials)
zaofu_mansion.reviews.create!(body: "Suyin is always a gracious host!", rating: 5, user: tenzin);
zaofu_mansion.reviews.create!(body: "My stay here was great except for the part where I got kidnapped..", rating: 4, user: korra);


fish_merchant = poe.listings.create!(
  title: "Fish Merchant Stand",
  price: 15,
  address: 'Zaofu, Earth Kingdom',
  description: "I've had two avatars come by here! There's not a lot of space but the view is unbeatable. Just don't mind the fish smell!",
  capacity: 1,
  beds: 0,
  bedrooms: 0,
  bathrooms: 0,
  home_type_id: house.id,
  lat: -21.616579336740593,
  lng: 31.8603515625
)
cover = fish_merchant.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/fish-merchant/front.jpg')
fish_merchant.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/fish-merchant/fishmonger2.jpg')
fish_merchant.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/fish-merchant/fishmonger1.jpg')
fish_merchant.update!(cover_photo_id: cover.id)
fish_merchant.listing_amenities.create!(amenity: heating)
fish_merchant.listing_amenities.create!(amenity: kitchen)
fish_merchant.listing_amenities.create!(amenity: essentials)


fancy_hotel = ming.listings.create!(
  title: "Lavish Hotel",
  price: 2000,
  address: 'Republic City, United Republic of Nations',
  description: "Upscale hotel for Republic City's more affluent citizens.",
  capacity: 4,
  beds: 4,
  bedrooms: 2,
  bathrooms: 1,
  home_type_id: hotel.id,
  lat: 43.8028187190472,
  lng: 8.25347900390625
)
cover = fancy_hotel.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/fancy-hotel/front.jpg')
fancy_hotel.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/fancy-hotel/dining.jpg')
fancy_hotel.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/fancy-hotel/fitting-room.jpg')
fancy_hotel.update!(cover_photo_id: cover.id)
fancy_hotel.listing_amenities.create!(amenity: heating)
fancy_hotel.listing_amenities.create!(amenity: essentials)
fancy_hotel.reviews.create!(body: "I've never been so pampered before.", rating: 5, user: mako);
fancy_hotel.reviews.create!(body: "I come here fairly often. The accomodations and service are always top-notch!", rating: 5, user: asami);


secluded_lodge = senna.listings.create!(
  title: "Secluded Lodge",
  price: 240,
  address: 'Harbor City, Southern Water Tribe',
  description: "It's located in the outskirts, overlooking the city. We don't stay here often so we rent it out most of the year.",
  capacity: 2,
  beds: 2,
  bedrooms: 1,
  bathrooms: 1,
  home_type_id: house.id,
  lat: -60.4355423066923,
  lng: -5.72113037109375
)
cover = secluded_lodge.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/secluded-lodge/inside.jpg')
secluded_lodge.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/secluded-lodge/front-profile.jpg')
secluded_lodge.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/secluded-lodge/entrance.jpg')
secluded_lodge.photos.create!(url: 'https://s3-us-west-1.amazonaws.com/lastairbnb/listings/secluded-lodge/couch.jpg')
secluded_lodge.update!(cover_photo_id: cover.id)
secluded_lodge.listing_amenities.create!(amenity: heating)
secluded_lodge.listing_amenities.create!(amenity: essentials)
secluded_lodge.listing_amenities.create!(amenity: kitchen)
