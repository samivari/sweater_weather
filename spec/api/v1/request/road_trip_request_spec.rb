require 'rails_helper'
RSpec.describe 'road trip request' do
  describe 'happy path' do
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
      expect(parsed[:data][:attributes][:travel_time]).to eq('01:49:57')
      expect(parsed[:data][:attributes][:weather][:temperature]).to eq(62.98)
      expect(parsed[:data][:attributes][:weather][:conditions]).to eq('scattered clouds')
    end
  end

  describe 'sad paths' do
    it 'cant make a request to plan a road trip with bad api key)', :vcr do
      user_1 = User.create!(email: 'sam@gmail.com', password: 'password', password_confirmation: 'password')

      user_params =
        {
          "origin": 'Denver,CO',
          "destination": 'Pueblo,CO',
          "api_key": 'skjfnkjsnfsfjn'
        }
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }

      post '/api/v1/road_trip', headers: headers, params: user_params.to_json
      expect(response).to_not be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:status]).to eq(401)
      expect(parsed[:message]).to eq('No Access - bad API key')
    end
  end

  it 'makes a request to plan a road trip(sad path impossible route)', :vcr do
    user_1 = User.create!(email: 'sam@gmail.com', password: 'password', password_confirmation: 'password')

    user_params =
      {
        "origin": 'Denver,CO',
        "destination": 'Honolulu, HI',
        "api_key": user_1.api_key
      }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: user_params.to_json
    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes][:travel_time]).to eq('Impossible route.')
    expect(parsed[:data][:attributes][:weather]).to eq('No Data.')
  end
end
