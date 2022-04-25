require 'rails_helper'
RSpec.describe DirectionFacade do
  it '.find_travel_time', :vcr do
    direction = DirectionFacade.find_travel_time('Denver,Co', 'Pueblo,Co')

    expect(direction).to be_a(Direction)
    expect(direction.travel_time).to eq(6544)
  end
end
