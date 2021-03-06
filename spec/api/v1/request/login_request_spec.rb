require 'rails_helper'
RSpec.describe 'login request' do
  it 'logins in a user with right credentials' do
    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    user_params = {
      "email": 'whatever@example.com',
      "password": 'password'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/sessions', headers: headers, params: user_params.to_json
    expect(response).to be_successful
    expect(response.status).to eq(200)
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes]).to have_key(:api_key)
  end

  it 'user cannot login with bad credentials' do
    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    user_params = {
      "email": 'whatever@example.com',
      "password": 'password12345'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/sessions', headers: headers, params: user_params.to_json
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:status]).to eq('ERROR')
    expect(parsed[:message]).to eq('Invalid username or password')
    expect(parsed[:data]).to eq({})
  end

  it 'user cannot login with bad credentials' do
    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    user_params = {
      "email": 'sam@example.com',
      "password": 'password'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/sessions', headers: headers, params: user_params.to_json
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:status]).to eq('ERROR')
    expect(parsed[:message]).to eq('Invalid username or password')
    expect(parsed[:data]).to eq({})
  end
end
