# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  url        :string           not null
#  listing_id :integer          not null
#  ord        :integer          default(0)
#  verified   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
