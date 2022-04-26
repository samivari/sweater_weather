class User < ApplicationRecord
  before_create :create_key
  has_secure_password
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_token :api_key
  validates_presence_of :password_digest, confirmation: true
  validates_presence_of :password_confirmation, presence: true

  def create_key
    self.api_key = SecureRandom.hex(20)
  end
end
