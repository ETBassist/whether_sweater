require 'rails_helper'

describe 'MapQuestService' do
  it 'can return data' do
    VCR.use_cassette('map_quest_coords_for_washington_dc') do
      data = MapQuestService.query_location_data('washington,dc')


      expect(data).to have_key(:results)
      expect(data[:results]).to be_an(Array)
      expect(data[:results][0]).to have_key(:locations)
      expect(data[:results][0][:locations]).to be_an(Array)
      expect(data[:results][0][:locations][0]).to have_key(:latLng)
      expect(data[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(data[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(data[:results][0][:locations][0][:latLng]).to have_key(:lng)
      expect(data[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end
  end

  it 'can return direction data' do
    VCR.use_cassette('get_directions_data_request') do
      data = MapQuestService.query_direction_data('Denver,Co', 'Pueblo,CO')

      expect(data).to have_key(:route)
      expect(data[:route]).to have_key(:realTime)
      expect(data[:route][:realTime]).to be_a(Integer)
    end
  end
end
