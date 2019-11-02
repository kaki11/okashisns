FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    micropost { nil }
  end
end
