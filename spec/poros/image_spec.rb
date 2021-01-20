require 'rails_helper'

describe 'Image PORO' do
  it 'has attributes' do
    response = File.read("#{Rails.root}/spec/fixtures/image_response.json")
    parsed_response = JSON.parse(response, symbolize_names: true) 
    image = Image.new(parsed_response)

    expect(image.image_url).to be_a(String)
    expect(image.image_url).to eq(parsed_response[:urls][:raw])
    expect(image.description).to eq(parsed_response[:description])
    expect(image.author).to eq(parsed_response[:user][:name])
    expect(image.source).to eq('Unsplash')
    expect(image.author_profile).to eq(parsed_response[:user][:links][:html])
  end
end
