FactoryBot.define do
  factory :user do
    last_name { ['山田', '佐藤', '田中'].sample } # rubocop:disable Style/WordArray
    first_name { ['太郎', '次郎', '花子'].sample } # rubocop:disable Style/WordArray
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    pin_number { Faker::Number.number(digits: 4) }
    user_type { Faker::Number.between(from: 1, to: 2) }
  end
end
