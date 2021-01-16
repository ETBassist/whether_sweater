require 'rails_helper'

describe 'Coordinates Facade' do
  it 'returns only the lat and long coordinates in a Hash' do
    coordinates = CoordinatesFacade.create_coordinates('washington,dc')

    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates[:lng]).to be_a(Float)
  end
end
