require 'rails_helper'

RSpec.describe Micropost, type: :model do
  describe '#create' do

    context '保存できる場合' do
      let(:user) { create(:user) }
      
      it 'pictureがあるとき' do
        expect(create(:micropost, title: nil, content: nil)).to be_valid
      end

      it 'pictureとtitleがあるとき' do
        expect(create(:micropost, content: nil)).to be_valid
      end

      it 'pictureとcontentがあるとき' do
        expect(create(:micropost, title: nil)).to be_valid
      end
    end

    context '保存できない場合' do
      let(:user) { create(:user) }

      it 'pictureがないとき' do
        micropost = build(:micropost, picture: nil)
        micropost.valid?
        expect(micropost.errors[:picture]).to include("can't be blank")
      end

      it 'userがいないとき' do
        micropost = build(:micropost, user_id: nil)
        micropost.valid?
        expect(micropost.errors[:user]).to include("must exist")
      end

    end
  end
end