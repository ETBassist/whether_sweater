class MapQuestService
  class << self
    def query_location_data(location)
      get_json("/geocoding/v1/address?location=#{location}")
    end

    private

    def get_json(uri)
      response = conn.get(uri)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
        faraday.params['key'] = ENV['MAPQUEST_KEY']
      end
    end
  end
end

