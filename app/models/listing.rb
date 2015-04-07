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

class Listing < ActiveRecord::Base

  belongs_to :owner, class_name: :User
  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities
  # has_one :cover_photo

  validates :owner, :title, :price, :capacity, :address, :description, presence: true



end
