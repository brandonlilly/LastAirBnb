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

require 'test_helper'

class ListingAmenityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
