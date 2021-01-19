require 'rails_helper'

describe '/api/v1/forecast?location=denver,co', :vcr do
  it 'can get the weather for a city' do
    VCR.use_cassette('mapquest_coordinate_request_full_spec') do
      VCR.use_cassette('open_weather_request_full_spec') do
        get '/api/v1/forecast?location=washington,dc'

        result = JSON.parse(response.body, symbolize_names: true)

        expect(result).to have_key(:data)
        expect(result[:data]).to have_key(:id)
        expect(result[:data][:id]).to eq(nil)
        expect(result[:data]).to have_key(:type)
        expect(result[:data][:type]).to eq('forecast')
        expect(result[:data]).to have_key(:attributes)

        expect(result[:data][:attributes]).to have_key(:current_weather)
        expect(result[:data][:attributes][:current_weather]).to have_key(:datetime)
        expect(result[:data][:attributes][:current_weather][:datetime]).to be_a(String)
        expect(result[:data][:attributes][:current_weather]).to have_key(:sunrise)
        expect(result[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
        expect(result[:data][:attributes][:current_weather]).to have_key(:sunset)
        expect(result[:data][:attributes][:current_weather][:sunset]).to be_a(String)
        expect(result[:data][:attributes][:current_weather]).to have_key(:temperature)
        expect(result[:data][:attributes][:current_weather][:temperature]).to be_a(Numeric)
        expect(result[:data][:attributes][:current_weather]).to have_key(:feels_like)
        expect(result[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
        expect(result[:data][:attributes][:current_weather]).to have_key(:humidity)
        expect(result[:data][:attributes][:current_weather][:humidity]).to be_a(Numeric)
        expect(result[:data][:attributes][:current_weather]).to have_key(:uvi)
        expect(result[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)
        expect(result[:data][:attributes][:current_weather]).to have_key(:visibility)
        expect(result[:data][:attributes][:current_weather][:visibility]).to be_a(Numeric)
        expect(result[:data][:attributes][:current_weather]).to have_key(:conditions)
        expect(result[:data][:attributes][:current_weather][:conditions]).to be_a(String)
        expect(result[:data][:attributes][:current_weather]).to have_key(:icon)
        expect(result[:data][:attributes][:current_weather][:icon]).to be_a(String)

        expect(result[:data][:attributes]).to have_key(:daily_weather)
        expect(result[:data][:attributes][:daily_weather]).to be_a(Array)
        expect(result[:data][:attributes][:daily_weather].length).to eq(5)
        
        result[:data][:attributes][:daily_weather].each do |day|
          expect(day).to have_key(:date)
          expect(day[:date]).to be_a(String)
          expect(day).to have_key(:sunrise)
          expect(day[:sunrise]).to be_a(String)
          expect(day).to have_key(:sunset)
          expect(day[:sunset]).to be_a(String)
          expect(day).to have_key(:max_temp)
          expect(day[:max_temp]).to be_a(Float)
          expect(day).to have_key(:min_temp)
          expect(day[:min_temp]).to be_a(Float)
          expect(day).to have_key(:conditions)
          expect(day[:conditions]).to be_a(String)
          expect(day).to have_key(:icon)
          expect(day[:icon]).to be_a(String)
        end

        expect(result[:data][:attributes]).to have_key(:hourly_weather)
        expect(result[:data][:attributes][:hourly_weather]).to be_a(Array)
        expect(result[:data][:attributes][:hourly_weather].length).to eq(8)

        result[:data][:attributes][:hourly_weather].each do |hour|
          expect(hour).to have_key(:time)
          expect(hour[:time]).to be_a(String)
          expect(hour).to have_key(:temperature)
          expect(hour[:temperature]).to be_a(Float)
          expect(hour).to have_key(:wind_speed)
          expect(hour[:wind_speed]).to be_a(String)
          expect(hour).to have_key(:wind_direction)
          expect(hour[:wind_direction]).to be_a(String)
          expect(hour).to have_key(:conditions)
          expect(hour[:conditions]).to be_a(String)
          expect(hour).to have_key(:icon)
          expect(hour[:icon]).to be_a(String)
        end
      end
    end
  end
end
