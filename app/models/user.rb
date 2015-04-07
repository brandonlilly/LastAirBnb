# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  attr_reader :password

  validates :email, :name, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :sessions, dependent: :destroy
  has_many :listings, foreign_key: :owner_id, dependent: :destroy

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email);
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.find_by_session_token(token)
    # Look up best practice
    return nil unless token
    session = Session.find_by_token(token)
    session ? session.user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password);
  end

  def password=(password)
    @password = password;
    self.password_digest = BCrypt::Password.create(password);
  end

end
