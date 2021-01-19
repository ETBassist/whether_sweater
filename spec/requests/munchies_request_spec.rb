require 'rails_helper'

describe 'Munchies Request endpoint' do
  it 'should return a response with forecast and restaurant info' do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq('munchie')
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:destination_city)
    expect(result[:data][:attributes][:destination_city]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:travel_time)
    expect(result[:data][:attributes][:travel_time]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:forecast)
    expect(result[:data][:attributes][:forecast]).to be_a(Hash)
    expect(result[:data][:attributes][:forecast]).to have_key(:summary)
    expect(result[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(result[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(result[:data][:attributes][:forecast][:temperature]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:restaurant)
    expect(result[:data][:attributes][:restaurant]).to have_key(:name)
    expect(result[:data][:attributes][:restaurant][:name]).to be_a(String)
    expect(result[:data][:attributes][:restaurant]).to have_key(:address)
    expect(result[:data][:attributes][:restaurant][:address]).to be_a(String)
  end
end
