# README

## Learning Goals
  * Expose and API that aggregate data from multiple external APIs
  * Expose an API that requires an authentication token
  * Expose an API for CRUD functionality
  * Determine completion criteria based on the needs of other developers
  * Research, select, and consume an API based on your needs as a developer

## Setup
Prerequisites:
  * Ruby 2.5.3
  * Rails 5.2.4.4
  * This API consumes the [Unsplash](https://unsplash.com/documentation#search-photos),
  [MapQuest](https://developer.mapquest.com/documentation/geocoding-api/),
  and [OpenWeather](https://openweathermap.org/api/one-call-api#data) APIs; an API key
    will be required for each.

Getting started:
  * First, clone this repository (or your fork of it)
  * `cd` into that repository
  * Run `bundle install` from the command line to install dependencies
  * Run `rails db:{create,migrate}` to create the database and run the tables
    within it.
  * Run `rails s` within your terminal; you should now be able to hit the
    endpoint in this API, either through a program like Postman or through an
    app of your creation.

## Endpoints
```
GET /api/v1/forecast?location=<city><state>`
Headers:
  Content-Type: application/json
  Accept: application/json
```

Note: `location` is a required parameter
More details:
<details>
  <pre>
    <code>
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-01-19 20:44:41 -0800",
                "sunrise": "2021-01-19 07:22:02 -0800",
                "sunset": "2021-01-19 17:18:39 -0800",
                "temperature": 56.98,
                "feels_like": 50.13,
                "humidity": 38,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "few clouds",
                "icon": "02n"
            },
            "hourly_weather": [
                {
                    "time": "20:00:00",
                    "temperature": 56.98,
                    "wind_speed": "17.05 mph",
                    "wind_direction": "NE",
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "21:00:00",
                    "temperature": 56.91,
                    "wind_speed": "15.03 mph",
                    "wind_direction": "NE",
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "22:00:00",
                    "temperature": 55.96,
                    "wind_speed": "13.22 mph",
                    "wind_direction": "NE",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "23:00:00",
                    "temperature": 54.73,
                    "wind_speed": "12.57 mph",
                    "wind_direction": "NE",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": " 0:00:00",
                    "temperature": 53.65,
                    "wind_speed": "11.54 mph",
                    "wind_direction": "ENE",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": " 1:00:00",
                    "temperature": 52.88,
                    "wind_speed": "9.89 mph",
                    "wind_direction": "ENE",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": " 2:00:00",
                    "temperature": 52.3,
                    "wind_speed": "10.04 mph",
                    "wind_direction": "ENE",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": " 3:00:00",
                    "temperature": 51.8,
                    "wind_speed": "10.18 mph",
                    "wind_direction": "ENE",
                    "conditions": "clear sky",
                    "icon": "01n"
                }
            ],
            "daily_weather": [
                {
                    "date": "2021-01-19",
                    "sunrise": "2021-01-19T07:22:02.000-08:00",
                    "sunset": "2021-01-19T17:18:39.000-08:00",
                    "max_temp": 61.3,
                    "min_temp": 53.67,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "date": "2021-01-20",
                    "sunrise": "2021-01-20T07:21:33.000-08:00",
                    "sunset": "2021-01-20T17:19:45.000-08:00",
                    "max_temp": 58.91,
                    "min_temp": 50.02,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-01-21",
                    "sunrise": "2021-01-21T07:21:02.000-08:00",
                    "sunset": "2021-01-21T17:20:50.000-08:00",
                    "max_temp": 55.99,
                    "min_temp": 49.69,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-01-22",
                    "sunrise": "2021-01-22T07:20:29.000-08:00",
                    "sunset": "2021-01-22T17:21:56.000-08:00",
                    "max_temp": 52.39,
                    "min_temp": 49.33,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-01-23",
                    "sunrise": "2021-01-23T07:19:55.000-08:00",
                    "sunset": "2021-01-23T17:23:02.000-08:00",
                    "max_temp": 53.67,
                    "min_temp": 46.47,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ]
        }
    }
}
    </code>
  </pre>
</details
