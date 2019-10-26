FactoryBot.define do
  factory :micropost do
    title { "hoge" }
    content { Faker::Dessert.variety }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/dami-.png')) }
    # ランダムな値にする
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    
    user
  end
end