require 'rails_helper'
RSpec.describe DirectionFacade do
  it '.find_travel_time', :vcr do
    travel_time = DirectionFacade.find_travel_time('Denver,Co', 'Pueblo,Co')

    expect(travel_time).to be_a(Direction)
  end
end
