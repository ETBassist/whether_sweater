require 'rails_helper'

describe 'Yelp Service Object' do
  it 'returns a response with restaurant info for specified location' do
    time = TripTime.new(9001)
    result = YelpService.query_business_search('pueblo,co', 'chinese', time)
    expect(result).to have_key(:businesses)
    expect(result[:businesses]).to be_a(Array)
    expect(result[:businesses][0]).to have_key(:is_closed)
    expect(result[:businesses][0][:is_closed]).to eq(false)
    expect(result[:businesses][0]).to have_key(:name)
    expect(result[:businesses][0][:name]).to be_a(String)
    expect(result[:businesses][0]).to have_key(:location)
    expect(result[:businesses][0][:location]).to have_key(:address1)
    expect(result[:businesses][0][:location][:address1]).to be_a(String)
    expect(result[:businesses][0][:location]).to have_key(:city)
    expect(result[:businesses][0][:location][:city]).to be_a(String)
    expect(result[:businesses][0][:location]).to have_key(:zip_code)
    expect(result[:businesses][0][:location][:zip_code]).to be_a(String)
  end
end
