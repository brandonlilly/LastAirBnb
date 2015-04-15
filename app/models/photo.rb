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

class Photo < ActiveRecord::Base

  belongs_to :listing

  validates :listing, :url, presence: true

  def verified?
    !!self.verified
  end
  
end
