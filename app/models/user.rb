class User < ApplicationRecord
  before_create :create_key
  has_secure_password
  has_secure_token :api_key
  validates :email, :password_digest, :password_confirmation, presence: true
  validates_uniqueness_of :email

  def create_key
    self.api_key = SecureRandom.hex(20)
  end
end
