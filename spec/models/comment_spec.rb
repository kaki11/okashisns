require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do

    context '保存できる場合' do
      it 'contentがあるとき' do
      end

      it 'userがいないがcontentがあるとき' do
      end
    end

    context '保存できない場合' do
      it 'contentがないとき' do
      end

    end
  end
end
