require 'rails_helper'
RSpec.describe ResturantFacade do
  it '.find_resturant', :vcr do
    direction = ResturantFacade.find_resturant('Chinese', 'Pueblo,Co', 1_650_902_492)
    expect(direction).to be_a(Resturant)
  end
end
