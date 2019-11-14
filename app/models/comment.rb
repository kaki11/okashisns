class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :micropost
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  default_scope -> { order(created_at: :desc) }
  validate :no_4_bytes

  private
    # 本文に4byte文字を使わないように
    def no_4_bytes
        if content.present?
            chars = content.each_char.select{|c| c.bytes.count >= 4}
            if chars.size > 0
                errors.add(:content, "に絵文字(#{chars.join('')})は使用できません。")
            end
        end
    end
end
