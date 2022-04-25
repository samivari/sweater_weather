require 'rails_helper'
RSpec.describe BackgroundService do
  it 'gets a photo based on search criteria', :vcr do
    location = 'denver, co'
    response = BackgroundService.get_background(location)
    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
  end
end
