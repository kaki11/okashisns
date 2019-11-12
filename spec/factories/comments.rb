FactoryBot.define do
  factory :comment do
    content { Faker::Games::Pokemon.name }

    user
    micropost
  end
end
