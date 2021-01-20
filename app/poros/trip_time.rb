class TripTime
  attr_reader :travel_time,
              :time_in_seconds,
              :lat,
              :lng


  def initialize(data)
    @travel_time = format_time(data[:route][:realTime])
    @time_in_seconds = data[:route][:realTime]
    @lat = data[:route][:locations].last[:latLng][:lat] if data[:route][:locations]
    @lng = data[:route][:locations].last[:latLng][:lng] if data[:route][:locations]
  end

  private

  def format_time(time)
    time ? "#{ time / 3600 }h#{ (time % 3600) / 60 }m" : 'impossible'
  end
end
