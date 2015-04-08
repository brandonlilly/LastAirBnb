# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  user_id    :integer          not null
#  body       :text             not null
#  rating     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base

  belongs_to :listing
  belongs_to :user

  validates :listing, :user, :body, :rating, presence: true
  validates :listing_id, uniqueness: {
    scope: :user_id,
    message: 'already reviewed that listing'
  }

end
