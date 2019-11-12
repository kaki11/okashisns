class Category < ApplicationRecord
  validates :name, uniqueness: true, length: { maximum: 15 }, presence: true
  belongs_to :micropost, optional: true
end

