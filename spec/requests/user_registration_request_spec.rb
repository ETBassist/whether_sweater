require 'rails_helper'

describe 'User Registration Endpoint' do
  it 'can register a user with info in request body' do
    body_data = { 
      email: "somebody@example.com",
      password: "password",
      password_confirmation: "password"
    }

    header_data = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/users', params: { headers: header_data, body: body_data }

    expect(User.all.last.email).to eq(body_data[:email])
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)

    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to be_a(String)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq('users')
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:email)
    expect(result[:data][:attributes][:email]).to eq(body_data[:email])
    expect(result[:data][:attributes]).to have_key(:api_key)
    expect(result[:data][:attributes][:api_key]).to be_a(String)

  end

  it 'will respond with an error with invalid input' do
    body_data = { 
      email: "somebody@example.com",
      password: "password",
      password_confirmation: "not the same password"
    }

    header_data = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/users', params: { headers: header_data, body: body_data }

    expect(response.status).to eq(400)

    expect(response.body).to eq("Password confirmation doesn't match Password")
  end
end
