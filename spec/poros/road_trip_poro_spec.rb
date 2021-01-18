require 'rails_helper'

describe 'RoadTripPORO' do
  it 'is created from three inputs (forecast, travel_time, destination)' do
    forecast = {
      :dt=>1611003600,
      :temp=>41.94,
      :feels_like=>34.07,
      :pressure=>1015,
      :humidity=>53,
      :dew_point=>26.76,
      :uvi=>1.12,
      :clouds=>98,
      :visibility=>10000,
      :wind_speed=>6.22,
      :wind_deg=>100,
      :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
      :pop=>0
    }

    travel_time = "2h30m"

    origin_params = { origin: "Denver,CO", destination: "Pueblo,CO" }


    roadtrip = RoadTrip.new(origin_params, travel_time, forecast)

    expect(roadtrip.end_city).to eq("Pueblo,CO")
    expect(roadtrip.start_city).to eq("Denver,CO")
    expect(roadtrip.travel_time).to eq(travel_time)
    expect(roadtrip.weather_at_eta).to be_a(Hash)
    expect(roadtrip.weather_at_eta).to have_key(:temperature)
    expect(roadtrip.weather_at_eta[:temperature]).to eq(41.94)
    expect(roadtrip.weather_at_eta).to have_key(:conditions)
    expect(roadtrip.weather_at_eta[:conditions]).to eq('overcast clouds')
  end
end
