require 'rails_helper'

RSpec.describe 'Resturant Service' do
  it 'returns resturant based on term, location, and time', :vcr do
    resturant = ResturantService.get_resturant('Chinese', 'Pueblo,Co', 1_650_902_492)
    expect(resturant).to be_a(Hash)
    expect(resturant[:businesses][0]).to have_key(:name)
    expect(resturant[:businesses][0][:location]).to have_key(:display_address)
  end
end
