require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe '#create' do
    let(:relationship) { build(:relationship) }
    
    it 'follow_idがないと保存できない' do
      expect(relationship).to_not be_valid
    end

  end
end