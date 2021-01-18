class TripTime
  attr_reader :travel_time,
              :time_in_seconds

  def initialize(data)
    @travel_time = "#{data[:route][:realTime] / 3600}h#{data[:route][:realTime]/60}m"
    @time_in_seconds = data[:route][:realTime]
  end
end
