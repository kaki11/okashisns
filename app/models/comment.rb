class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :micropost_id, presence: true, length: { maximum: 200 }
end
