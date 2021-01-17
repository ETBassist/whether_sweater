class User < ApplicationRecord
  has_secure_password

  validates :email, :api_key, uniqueness: true, presence: true
end
