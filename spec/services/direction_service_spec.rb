require 'rails_helper'

RSpec.describe 'Direction Service' do
  it 'a directions from a start and end point', :vcr do
    data = DirectionService.get_travel_time('Denver,CO', 'Pueblo,Co')
    expect(data).to be_a Hash
    expect(data[:route]).to have_key(:formattedTime)
  end
end
