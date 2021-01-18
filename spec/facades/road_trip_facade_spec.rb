require 'rails_helper'

describe 'RoadTripFacade' do
  it 'instantiates a road trip object from other API calls' do
    params = { body: { origin: 'Denver,CO', destination: 'Pueblo,CO' }}
    road_trip = RoadTripFacade.create_road_trip(params[:body])

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to eq(params[:body][:origin])
    expect(road_trip.end_city).to eq(params[:body][:destination])
    expect(road_trip.type).to eq('roadtrip')
    expect(road_trip.id).to eq(nil)
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.weather_at_eta).to be_a(Hash)
    expect(road_trip.weather_at_eta).to have_key(:temperature)
    expect(road_trip.weather_at_eta).to have_key(:conditions)
  end
end
