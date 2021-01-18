require 'rails_helper'

describe 'Road Trip POST request' do
  before :each do
    @user = create(:user)
  end

  it 'returns details for a road trip including weather forecast' do
    body_data = {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: @user.api_key
    }

    post '/api/v1/road_trip', params: body_data 

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq('roadtrip')
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:start_city)
    expect(result[:data][:attributes][:start_city]).to eq(body_data[:origin])
    expect(result[:data][:attributes]).to have_key(:end_city)
    expect(result[:data][:attributes][:end_city]).to eq(body_data[:destination])
    expect(result[:data][:attributes]).to have_key(:travel_time)
    expect(result[:data][:attributes]).to have_key(:weather_at_eta)
    expect(result[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(result[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(result[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(result[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
