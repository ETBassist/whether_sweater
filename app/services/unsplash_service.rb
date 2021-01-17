class UnsplashService
  def self.city_image_search(city)
    get_json("/search/photos?query=city of #{city}")
  end

  module UnsplashConnectable
    private

    def get_json(uri)
      response = conn.get(uri)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(
        url: 'https://api.unsplash.com',
        headers: {
          'Authorization': "Client-ID #{ENV['UNSPLASH_KEY']}",
          'Accept-Verion': 'v1'
        }
      ) 
    end
  end
  extend UnsplashConnectable
end

