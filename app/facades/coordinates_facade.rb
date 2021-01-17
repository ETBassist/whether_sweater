class CoordinatesFacade
  class << self
    def create_coordinates(location)
      data = MapQuestService.query_location_data(location)
      {
        lat: data[:results][0][:locations][0][:latLng][:lat],
        lng: data[:results][0][:locations][0][:latLng][:lng]
      }
    end
  end
end
