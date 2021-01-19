require 'rails_helper'
require './spec/fixtures/yelp_response'
require './spec/fixtures/weather_response'

describe 'Munchie PORO' do
  it 'has attributes matching expected response' do
    time = TripTime.new( {route: { realTime: 9000 } } )
    weather = WeatherResponse::DATA
    munchie = Munchie.new(YelpResponse::DATA[:businesses][0], time, weather)

    expect(munchie.destination_city).to eq('San Francisco, CA')
    expect(munchie.travel_time).to eq('2 hours 30 min')
    expect(munchie.forecast).to be_a(Hash)
    expect(munchie.forecast).to have_key(:summary)
    expect(munchie.forecast).to have_key(:temperature)
    expect(munchie.restaurant).to be_a(Hash)
    expect(munchie.restaurant[:name]).to eq('Clement BBQ')
    expect(munchie.restaurant[:address]).to eq('617 Clement St, San Francisco, CA 94118')
  end
end
