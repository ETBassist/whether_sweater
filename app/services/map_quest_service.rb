class MapQuestService
  def self.query_location_data(location)
    require "pry";binding.pry 
    get_json("/geocoding/v1/address?location=#{location}")
  end

  module Connectable
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

  extend Connectable
end

