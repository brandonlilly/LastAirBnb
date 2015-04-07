# == Schema Information
#
# Table name: amenities
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Amenity < ActiveRecord::Base

  has_many :listing_amenities
  has_many :listings, through: :listing_amenities

end
