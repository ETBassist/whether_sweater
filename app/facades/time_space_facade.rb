class TimeSpaceFacade
  class << self
    def query_direction_time_data(start, finish)
      TripTime.new(MapQuestService.query_direction_data(start, finish))
    end
  end
end
