require 'rails_helper'

describe 'Image Serializer' do
  it 'returns a JSON serialized image object' do
    VCR.use_cassette('facade_image_search') do
      image = ImageFacade.image_search('denver,co')
      serialized_image = ImageSerializer.new(image).to_json

      parsed_image = JSON.parse(serialized_image, symbolize_names: true)

      expect(parsed_image[:data]).to have_key(:id)
      expect(parsed_image[:data][:id]).to eq(nil)
      expect(parsed_image[:data]).to have_key(:type)
      expect(parsed_image[:data][:type]).to eq('image')
      expect(parsed_image[:data]).to have_key(:attributes)
      expect(parsed_image[:data][:attributes]).to have_key(:image_url)
      expect(parsed_image[:data][:attributes][:image_url]).to be_a(String)
      expect(parsed_image[:data][:attributes]).to have_key(:description)
      expect(parsed_image[:data][:attributes][:description]).to be_a(String)
      expect(parsed_image[:data][:attributes]).to have_key(:author)
      expect(parsed_image[:data][:attributes][:author]).to be_a(String)
    end
  end
end
