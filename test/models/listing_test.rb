# == Schema Information
#
# Table name: listings
#
#  id             :integer          not null, primary key
#  owner_id       :integer          not null
#  title          :string           not null
#  price          :integer          not null
#  capacity       :integer          not null
#  address        :string           not null
#  description    :text             not null
#  cover_photo_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
