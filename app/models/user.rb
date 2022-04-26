class User < ApplicationRecord
  before_create :create_key
  has_secure_password
  has_secure_token :api_key
  validates_presence_of :email, email: true
  validates_uniqueness_of :email
  validates_presence_of :password_digest, confirmation: true
  validates_presence_of :password_confirmation, presence: true

  def create_key
    self.api_key = SecureRandom.hex(20)
  end
end
