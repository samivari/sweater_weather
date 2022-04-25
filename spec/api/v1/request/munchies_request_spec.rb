require 'rails_helper'

RSpec.describe 'Munchies request ' do
  it 'returns a a resturant for a specific area in a JSON response', :vcr do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
    expect(response).to be_successful
    parsed = JSON.parse(response.body)
    expect(parsed['data']['id']).to eq('null')
    expect(parsed['data']['type']).to be_a(Hash)
    expect(parsed['data']['attributes']).to have_key('destination_city')
    expect(parsed['data']['attributes']).to have_key('travel_time')
    expect(parsed['data']['attributes']).to have_key('forecast')
    expect(parsed['data']['attributes']['forecast']).to have_key('summary')
    expect(parsed['data']['attributes']['forecast']).to have_key('temperature')
    expect(parsed['data']['attributes']).to have_key('resturant')
    expect(parsed['data']['attributes']['resturant']).to have_key('name')
    expect(parsed['data']['attributes']['resturant']).to have_key('address')
  end
end
