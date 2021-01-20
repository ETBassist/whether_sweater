require 'rails_helper'

describe 'RoadTripPORO' do
  it 'is created from three inputs (forecast, travel_time, destination)' do
    route_time = { route: { realTime: 9000 } }

    travel_time = TripTime.new(route_time)

    origin_params = { origin: "Denver,CO", destination: "Pueblo,CO" }
    coords = CoordinatesFacade.create_coordinates(origin_params[:destination])
    weather = OpenWeatherService.get_forecast(coords[:lat], coords[:lng])


    roadtrip = RoadTrip.new(origin_params, travel_time, weather)

    expect(roadtrip.end_city).to eq('Pueblo,CO')
    expect(roadtrip.start_city).to eq('Denver,CO')
    expect(roadtrip.travel_time).to eq('2h30m')
    expect(roadtrip.weather_at_eta).to be_a(Hash)
    expect(roadtrip.weather_at_eta).to have_key(:temperature)
    expect(roadtrip.weather_at_eta[:temperature]).to be_a(Numeric)
    expect(roadtrip.weather_at_eta).to have_key(:conditions)
    expect(roadtrip.weather_at_eta[:conditions]).to be_a(String)
  end
end
