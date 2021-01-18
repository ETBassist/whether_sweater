require 'rails_helper'

describe 'Road Trip Serializer' do
  it 'can return an object which can be rendered into a json response' do
    params = { body: { origin: 'Denver,CO', destination: 'Pueblo,CO' }}
    roadtrip = RoadTripFacade.create_road_trip(params[:body])
    
    serialized_trip = RoadTripSerializer.new(roadtrip).to_json
    
    parsed_trip = JSON.parse(serialized_trip, symbolize_names: true)

    expect(parsed_trip).to have_key(:data)
    expect(parsed_trip[:data]).to have_key(:id)
    expect(parsed_trip[:data][:id]).to eq(nil)
    expect(parsed_trip[:data]).to have_key(:type)
    expect(parsed_trip[:data][:type]).to eq('roadtrip')
    expect(parsed_trip[:data]).to have_key(:attributes)
    expect(parsed_trip[:data][:attributes]).to have_key(:start_city)
    expect(parsed_trip[:data][:attributes]).to have_key(:end_city)
    expect(parsed_trip[:data][:attributes]).to have_key(:travel_time)
    expect(parsed_trip[:data][:attributes]).to have_key(:weather_at_eta)
    expect(parsed_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(parsed_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(parsed_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
