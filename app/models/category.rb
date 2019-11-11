class Category < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :micropost, optional: true
end

