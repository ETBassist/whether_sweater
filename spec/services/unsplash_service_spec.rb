require 'rails_helper'

describe 'UnspashService' do
  it 'Returns parsed JSON responses for the Unsplash image API' do
    VCR.use_cassette('denver_image_search') do
      data = UnsplashService.city_image_search('denver,co')

      expect(data).to have_key(:results)
      expect(data[:results]).to be_an(Array)
      expect(data[:results][0]).to be_a(Hash)
      expect(data[:results][0]).to have_key(:description)
      expect(data[:results][0]).to have_key(:urls)
      expect(data[:results][0][:urls]).to be_a(Hash)
      expect(data[:results][0][:urls]).to have_key(:raw)

      expect(data[:results][0]).to have_key(:user)
      expect(data[:results][0][:user]).to have_key(:name)
      expect(data[:results][0][:user][:name]).to be_a(String)
    end
  end
end
