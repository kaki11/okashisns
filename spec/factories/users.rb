FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    name { Faker::Games::Pokemon.name }
    password { password }
    password_confirmation { password }
    sequence(:email) {Faker::Internet.email}
  end

end