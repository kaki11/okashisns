require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do

    context '保存できる場合' do
      let(:comment) { create(:comment) }

      it 'contentがあるとき' do
        expect(comment).to be_valid
      end

      it 'contentが200文字以内の時' do
        comment = create(:comment, content: "a"*200)
        expect(comment).to be_valid
      end

    end

    context '保存できない場合' do
      let(:comment) { create(:comment) }

      it 'contentが空のとき' do
        comment = build(:comment, content: "")
        expect(comment).to_not be_valid
      end

      it 'contentが201文字以上の時' do
        comment = build(:comment, content: "a"*201)
        expect(comment).to_not be_valid
      end

      it '投稿がない時' do
        comment = build(:comment, micropost_id: "")
        expect(comment).to_not be_valid
      end

    end
  end
end
