class User < ApplicationRecord
  has_many :microposts, dependent: :destroy #userと一緒に破棄される
  has_many :favorites
  has_many :favorite_microposts, through: :favorites, source: 'micropost'
  has_many :comments

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  default_scope -> { order(created_at: :desc) } #新しい投稿から並ぶ
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A\S+@\S+\.\S+\z/ },
                    # 大文字小文字を区別しない
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


end
