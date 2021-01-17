require 'rails_helper'

describe 'Image Endpoint Search' do
  it 'returns an image when searching for a city image' do
    get '/api/v1/backgrounds?location=denver,co'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq('image')

    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to be_a(Hash)
    expect(result[:data][:attributes]).to have_key(:image)
    expect(result[:data][:attributes][:image]).to have_key(:image_url)
    expect(result[:data][:attributes][:image][:image_url]).to be_a(String)
    expect(result[:data][:attributes][:image]).to have_key(:location)
    expect(result[:data][:attributes][:image][:location]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:credits)
    expect(result[:data][:attributes][:credits]).to be_a(Hash)
    expect(result[:data][:attributes][:credits]).to have_key(:source)
    expect(result[:data][:attributes][:credits][:source]).to be_a(String)
    expect(result[:data][:attributes][:credits]).to have_key(:author)
    expect(result[:data][:attributes][:credits][:author]).to be_a(String)
  end
end
