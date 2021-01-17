require 'rails_helper'

describe 'Image Facade' do
  it 'instantiates and Image from a response' do
    VCR.use_cassette('facade_image_search') do
      image = ImageFacade.image_search('denver,co')

      expect(image).to be_an(Image)
      expect(image.image_url).to be_a(String)
      expect(image.author).to be_a(String)
      expect(image.description).to be_a(String)
    end
  end
end
