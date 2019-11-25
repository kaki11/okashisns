class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :comments, dependent: :destroy
  belongs_to :category
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, length: { maximum: 50 }

  validates :content, length: { maximum: 800 }
  validates :picture, presence: true
  validate  :picture_size
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
    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "画像サイズ5MB以上は投稿できません")
      end
    end
end