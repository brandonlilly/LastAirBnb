# == Schema Information
#
# Table name: listing_amenities
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  amenity_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ListingAmenity < ActiveRecord::Base

  belongs_to :listing
  belongs_to :amenity

  validates :listing, :amenity, presence: true
  validates :listing_id, uniqueness: {
    scope: :amenity_id,
    message: 'already listed that amenity'
  }

end
