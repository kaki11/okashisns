class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :micropost
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  default_scope -> { order(created_at: :desc) }
end
