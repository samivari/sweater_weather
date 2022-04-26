require 'rails_helper'
RSpec.describe 'user registration' do
  describe 'happy path' do
    it 'registers a user from request(happy path PW match)' do
      user_params = {
        "email": 'whatever@example.com',
        "password": 'password',
        "password_confirmation": 'password'
      }
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
      post '/api/v1/users', headers: headers, params: user_params.to_json
      expect(response).to be_successful
      expect(response.status).to eq(201)
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to have_key(:email)
      expect(parsed[:data][:attributes]).to have_key(:api_key)
    end
  end

  describe 'sad path' do
    it 'registers a user from request  no PW match' do
      user_params = {
        "email": 'whatever@example.com',
        "password": 'password',
        "password_confirmation": 'password20'
      }
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
      post '/api/v1/users', headers: headers, params: user_params.to_json

      expect(response).to_not be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:status]).to eq(400)
      expect(parsed[:message]).to eq("Password confirmation doesn't match Password")
    end
  end

  it 'registers a user from request  nil PW' do
    user_params = {
      "email": 'whatever@example.com',
      "password": 'password',
      "password_confirmation": nil
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq(400)
    expect(parsed[:message]).to eq("Password confirmation can't be blank")
  end
  it 'registers a user from request  no PW' do
    user_params = {
      "email": 'whatever@example.com',
      "password": ' ',
      "password_confirmation": ' '
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:status]).to eq(400)
    expect(parsed[:message]).to eq("Password confirmation can't be blank")
  end
  it 'registers a user from request invalid email' do
    user_params = {
      "email": 'whateverexample.com',
      "password": 'password',
      "password_confirmation": 'password'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
    post '/api/v1/users', headers: headers, params: user_params.to_json

    #  expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    require 'pry'
    binding.pry
    expect(parsed[:status]).to eq(400)
    expect(parsed[:message]).to eq("Password confirmation can't be blank")
  end
end
