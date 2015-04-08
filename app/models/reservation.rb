# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  listing_id :integer          not null
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reservation < ActiveRecord::Base

  belongs_to :listing
  belongs_to :user

  validates :user, :listing, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ['APPROVED', 'DENIED', 'PENDING'] }

  after_initialize :ensure_status
  
  def approved?
    status == 'APPROVED'
  end

  def pending?
    status == 'PENDING'
  end

  private

  def ensure_status
    self.status ||= 'PENDING'
  end



end
