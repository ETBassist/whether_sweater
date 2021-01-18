class TripTime
  attr_reader :travel_time,
              :time_in_seconds

  def initialize(data)
    @travel_time = format_time(data[:route][:realTime])
    @time_in_seconds = data[:route][:realTime]
  end

  private

  def format_time(time)
    "#{ time / 3600 }h#{ (time % 3600) / 60 }m"
  end
end
