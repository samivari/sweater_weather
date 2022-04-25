require 'rails_helper'
RSpec.describe 'Direction Poro' do
  it 'takes JSON response and create ruby object', :vcr do
    data = DirectionService.get_travel_time('Denver,CO', 'Pueblo,CO')
    direction = Direction.new(data)

    expect(direction).to be_a(Direction)
    expect(direction.travel_time).to eq(6560)
  end
end
