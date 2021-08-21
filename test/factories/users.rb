FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    sequence(:email) { |n| "john@example#{n}.com" }
    password { "secret_password" }
    role { "member" }
    auth_token { SecureRandom.urlsafe_base64 }
  end
end
