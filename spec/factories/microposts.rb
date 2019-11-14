FactoryBot.define do
  factory :micropost do
    title { "hoge" }
    content { Faker::Dessert.variety }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/dami-.jpg')) }
    category_id { 1 }
    # ランダムな値にする
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    
    user
    category
  end
end