require 'rails_helper'

describe 'User Log In request' do
  before :each do
    @user = create(:user, password: "password")
  end

  it 'can log a user in with valid credentials' do
    body_data = {
      email: @user.email,
      password: @user.password
    }

    headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(body_data)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq('users')
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq(@user.id.to_s)
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:email)
    expect(result[:data][:attributes][:email]).to eq(@user.email)
    expect(result[:data][:attributes]).to have_key(:api_key)
    expect(result[:data][:attributes][:api_key]).to eq(@user.api_key)
  end
  
  it 'is not case-sensitive for emails' do
    body_data = {
      email: @user.email.upcase,
      password: @user.password
    }

    post '/api/v1/sessions', params: body_data

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq('users')
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq(@user.id.to_s)
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:email)
    expect(result[:data][:attributes][:email]).to eq(@user.email)
    expect(result[:data][:attributes]).to have_key(:api_key)
    expect(result[:data][:attributes][:api_key]).to eq(@user.api_key)
  end

  it 'returns an error if password is incorrect' do
    body_data = {
      email: @user.email,
      password: 'the wrong password'
    }

    post '/api/v1/sessions', params: body_data

    expect(response.status).to eq(400)

    expect(response.body).to eq('Invalid Credentials')
  end

  it 'returns an error if email is incorrect' do
    body_data = {
      email: "#{@user.email} and some nonsese",
      password: @user.password
    }

    post '/api/v1/sessions', params: body_data

    expect(response.status).to eq(400)

    expect(response.body).to eq('Invalid Credentials')
  end
end
