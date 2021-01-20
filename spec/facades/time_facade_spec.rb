require 'rails_helper'

describe 'Time Space Facade' do
  it 'returns a time object from response' do
    VCR.use_cassette('query_direction_time') do
      time_space = TimeSpaceFacade.query_direction_time_data('San Francisco,CA', 'Denver,CO')

      expect(time_space).to be_a(TripTime)
      expect(time_space.time_in_seconds).to be_a(Integer)
      expect(time_space.travel_time).to be_a(String)
      expect(time_space.lat).to be_a(Float)
      expect(time_space.lng).to be_a(Float)
    end
  end
end
