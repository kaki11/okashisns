FactoryBot.define do

  factory :user do
    name { "test" }
    password { "password00" }
    password_confirmation { "password00" }
    sequence(:email) {Faker::Internet.email}
  end

end