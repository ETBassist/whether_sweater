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
    expect(result[:data][:attributes]).to have_key(:image_url)
    expect(result[:data][:attributes][:image_url]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:description)
    expect(result[:data][:attributes][:description]).to be_a(String)
    expect(result[:data][:attributes]).to be_a(Hash)
    expect(result[:data][:attributes]).to have_key(:author)
    expect(result[:data][:attributes][:author]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:source)
    expect(result[:data][:attributes][:source]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:author_profile)
    expect(result[:data][:attributes][:author_profile]).to be_a(String)
  end

  it 'returns an error if param is missing' do
    get '/api/v1/backgrounds'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data]).to eq('Missing required parameter')
  end
end
