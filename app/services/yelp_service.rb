class YelpService
  class << self
    def query_business_search(destination, food, time)
      get_json("/v3/businesses/search?term=#{food}&location=#{destination}&open_at=#{time}")
    end

    private

    def get_json(uri)
      response = conn.get(uri)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://api.yelp.com') do |faraday|
        faraday.headers['Authorization'] = "Bearer #{ENV['YELP_KEY']}"
      end
    end
  end
end

