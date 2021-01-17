FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    api_key { SecureRandom.uuid }
    password_digest { Faker::Internet.password }
  end
end
