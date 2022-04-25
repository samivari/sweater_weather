require 'rails_helper'
RSpec.describe 'Resturant Poro' do
  it 'takes JSON response and create ruby object', :vcr do
    data = ResturantService.get_resturant('Chinese', 'Pueblo,Co', 1_650_902_492)
    resturant = Resturant.new(data)

    expect(resturant).to be_a(Resturant)
    expect(resturant.name).to eq("Kan's Kitchen")
    expect(resturant.address).to eq('1620 S Prairie Ave Pueblo, CO 81005')
  end
end
