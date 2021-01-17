FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    api_key { SecureRandom.base64 }
    password_digest { Faker::Internet.password }
  end
end
