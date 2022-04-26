require 'rails_helper'
RSpec.describe 'road trip request' do
  it 'makes a request to plan a road trip', :vcr do
    user = User.create!(email: 'sam@gmail.com', password: 'password', password_confirmation: 'password')

    user_params =
      {
        "origin": 'Denver,CO',
        "destination": 'Pueblo,CO',
        "api_key": user.api_key
      }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: user_params.to_json
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data][:type]).to eq('roadtrip')
    expect(parsed[:data][:attributes][:start_city]).to eq('Denver,CO')
    expect(parsed[:data][:attributes][:end_city]).to eq('Pueblo,CO')
    expect(parsed[:data][:attributes][:travel_time]).to eq('01:45:23')
    expect(parsed[:data][:attributes][:arrival_weather][:time]).to be_a
  end
end
