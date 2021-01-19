require 'rails_helper'

describe 'ForecastSerializer' do
  it 'returns a serialized Forecast without unwanted attributes' do
    VCR.use_cassette('forecast_serializer_spec') do
      forecast = ForecastFacade.create_forecast_for_coordinates(38.8921, -77.0199)
      serialized_forecast = ForecastSerializer.new(forecast).to_json
      formatted_forecast = JSON.parse(serialized_forecast, symbolize_names: true)

      expect(formatted_forecast).to have_key(:data)
      expect(formatted_forecast[:data]).to have_key(:id)
      expect(formatted_forecast[:data][:id]).to eq(nil)
      expect(formatted_forecast[:data]).to have_key(:type)
      expect(formatted_forecast[:data][:type]).to eq('forecast')

      expect(formatted_forecast[:data][:attributes]).to have_key(:current_weather)
      expect(formatted_forecast[:data][:attributes]).to have_key(:daily_weather)
      expect(formatted_forecast[:data][:attributes][:daily_weather]).to be_an(Array)
      expect(formatted_forecast[:data][:attributes]).to have_key(:hourly_weather)
      expect(formatted_forecast[:data][:attributes][:hourly_weather]).to be_an(Array)

      formatted_forecast[:data][:attributes][:daily_weather].each do |day|
        expect(day).to_not have_key(:feels_like)
        expect(day).to_not have_key(:pressure)
        expect(day).to_not have_key(:dew_point)
        expect(day).to_not have_key(:clouds)
      end

      formatted_forecast[:data][:attributes][:hourly_weather].each do |hour|
        expect(hour).to_not have_key(:feels_like)
        expect(hour).to_not have_key(:pressure)
        expect(hour).to_not have_key(:dew_point)
        expect(hour).to_not have_key(:clouds)
      end
    end
  end
end
