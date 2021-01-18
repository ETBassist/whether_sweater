require 'rails_helper'

describe 'Trip Time PORO' do
  it 'can filter direction data to get trip time' do
    data = {
      "route": {
        "hasTollRoad": false,
        "computedWaypoints": [],
        "fuelUsed": 0.23,
        "hasUnpaved": false,
        "hasHighway": false,
        "realTime": 653,
        "boundingBox": {
          "ul": {
            "lng": -77.089424,
            "lat": 38.893276
          },
          "lr": {
            "lng": -77.077087,
            "lat": 38.848926
          }
        }
      }
    }

    time = TripTime.new(data)

    expect(time.travel_time).to eq('0h10m')
    expect(time.time_in_seconds).to eq(653)
  end

  it 'will give impossible as travel time if trip is not possible' do
    data = {
      "route": {
        "routeError": {
          "errorCode": 2,
          "message": ""
        }
      },
      "info": {
        "statuscode": 402,
        "copyright": {
          "imageAltText": "© 2020 MapQuest, Inc.",
          "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
          "text": "© 2020 MapQuest, Inc."
        },
        "messages": [ "We are unable to route with the given locations." ]
        }
      }
    time = TripTime.new(data)

    expect(time.travel_time).to eq('impossible')
  end
end
