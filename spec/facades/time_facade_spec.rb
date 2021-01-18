require 'rails_helper'

describe 'Time Facade' do
  it 'returns a time object from response' do
    VCR.use_cassette('query_direction_time') do
      time = TimeFacade.query_direction_time_data('San Francisco,CA', 'Denver,CO')

      expect(time).to be_a(TripTime)
      expect(time.time_in_seconds).to be_a(Integer)
      expect(time.travel_time).to be_a(String)
    end
  end
end
