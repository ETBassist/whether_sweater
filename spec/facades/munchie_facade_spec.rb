require 'rails_helper' 

describe 'MunchieFacade' do
  it 'instantiates a munchie object' do
    params = { start: 'San Francisco,CA', destination: 'Denver,CO', food: 'chinese' }
    munchie = MunchieFacade.create_munchie(params)

    expect(munchie).to be_a(Munchie)
  end
end
