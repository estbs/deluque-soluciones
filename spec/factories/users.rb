FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    lastname { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    identification_type { 'cc' }
    identification_number { Faker::Number.number(digits: 10) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    address
  end
end
