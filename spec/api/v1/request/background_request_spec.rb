require 'rails_helper'

RSpec.describe 'background request ' do
  it 'returns url for a background image in a JSON response', :vcr do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
    parsed = JSON.parse(response.body)
    expect(parsed['data']['id']).to eq(nil)
    expect(parsed['data']['type']).to eq('image')
    expect(parsed['data']['attributes']).to be_a(Hash)
    expect(parsed['data']['attributes']).to have_key('location')
    expect(parsed['data']['attributes']).to have_key('author')
    expect(parsed['data']['attributes']).to have_key('image_url')
    expect(parsed['data']['attributes']).to have_key('logo')
    expect(parsed['data']['attributes']).to have_key('source')
  end
end
