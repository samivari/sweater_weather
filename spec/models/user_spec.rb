require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validataions' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_confirmation }
    it { should have_secure_password }
  end

  describe 'user create' do
    it 'creates user object with all attributes' do
      user = User.create!(email: 'sam@aol.com', password: 'password', password_confirmation: 'password')
      expect(user).to have_attributes(email: 'sam@aol.com')
      expect(user).to have_attributes(password: 'password')
      expect(user).to have_attributes(password_confirmation: 'password')
      expect(user).to have_attribute(:api_key)
    end
  end
end
