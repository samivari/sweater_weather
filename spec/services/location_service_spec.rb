require 'rails_helper'

RSpec.describe 'Location Service' do
  it 'returns longitude and lattitude', :vcr do
    location = LocationService.get_coords('Denver,CO')
    expect(location).to be_a Hash
    expect(location[:results]).to be_a Array
    location[:results].each do |l|
      expect(l).to be_a Hash
      expect(l[:locations]).to be_a Array
      expect(l[:locations][0]).to be_a Hash
      expect(l[:locations][0][:latLng]).to have_key(:lat)
      expect(l[:locations][0][:latLng]).to have_key(:lng)
    end
  end
end
