require 'rails_helper' 

describe 'UsersSerializer' do
  it 'serializes User data' do
    user = create(:user)

    serialized_user = UsersSerializer.new(user).to_json

    parsed_user = JSON.parse(serialized_user, symbolize_names: true)

    expect(parsed_user).to have_key(:data)
    expect(parsed_user[:data]).to have_key(:id)
    expect(parsed_user[:data][:id]).to be_a(String)
    expect(parsed_user[:data]).to have_key(:type)
    expect(parsed_user[:data][:type]).to eq('users')
    expect(parsed_user[:data]).to have_key(:attributes)
    expect(parsed_user[:data][:attributes]).to have_key(:email)
    expect(parsed_user[:data][:attributes][:email]).to eq(user.email)
    expect(parsed_user[:data][:attributes]).to have_key(:api_key)
    expect(parsed_user[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end
