class OpenWeatherService
  def self.get_forecast(lat, lng)
    get_json("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exlude=minutely")
  end

  module Connectable
    private

    def get_json(uri)
      response = conn.get(uri)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
        faraday.params['appid'] = ENV['OPEN_WEATHER_KEY']
      end
    end
  end

  extend Connectable
end

