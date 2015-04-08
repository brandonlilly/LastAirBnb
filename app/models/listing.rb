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
#  home_type_id   :integer          not null
#  bedrooms       :integer          not null
#  beds           :integer          not null
#  bathrooms      :integer          not null
#

class Listing < ActiveRecord::Base

  belongs_to :owner, class_name: :User
  belongs_to :home_type
  has_many :reviews
  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities

  validates :owner, :title, :price, :capacity, :address, :description,
    :home_type, :bedrooms, :beds, :bathrooms, presence: true




end
