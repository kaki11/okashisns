require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#create' do

    context '保存できる場合' do
      let(:category) { create(:category) }

      it "nameが空でないとき" do
        expect(category).to be_valid
      end

      it "nameが15文字以内のとき" do
        category = build(:category, name: "a"*15)
        expect(category).to be_valid
      end
    end

    context '保存できない場合' do
      let(:category) { create(:category) }

      it "nameが空のとき登録できない" do
        category = build(:category, name: "")
        expect(category).to_not be_valid
      end

      it "nameが16文字以上のとき" do
        category = build(:category, name: "a"*16)
        expect(category).to_not be_valid
      end

      it "同じnameがすでにあるとき" do
        another_category = build(:category, name: category.name)
        expect(another_category).to_not be_valid
      end
    end

  end
end
