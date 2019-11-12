require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe '#create' do

    it 'user_idがあれがお気に入り登録できる' do
      favorite = create(:favorite)
      expect(favorite).to be_valid
    end

    it 'user_idがなければお気に入り登録できない' do
      favorite = build(:favorite, user_id: nil)
      favorite.valid?
      expect(favorite.errors[:user_id]).to include("を入力してください")
    end

    it '投稿がなければお気に入り登録できない' do
      favorite = build(:favorite, micropost_id: nil)
      favorite.valid?
      expect(favorite.errors[:micropost_id]).to include("を入力してください")
    end

  end
end
