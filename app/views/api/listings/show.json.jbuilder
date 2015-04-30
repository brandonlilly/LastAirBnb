# render json: @listing, include: [:amenities, :home_type, :reviews, :photos, :cover_photo]

json.(@listing,
  :id, :title, :price, :capacity, :address, :description,
  :created_at, :updated_at, :bedrooms, :beds, :bathrooms, :lat, :lng
)

json.home_type @listing.home_type

json.amenities @listing.amenities do |amenity|
  json.(amenity, :id, :name, :description)
end

json.reviews @listing.reviews do |review|
  json.(review, :id, :body, :rating)
  json.user review.user, :id, :name
end

json.photos @listing.photos

json.cover_photo @listing.cover_photo

json.owner @listing.owner, :id, :name
