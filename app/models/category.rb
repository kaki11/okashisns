class Category < ApplicationRecord
  validates :name, uniqueness: true, length: { maximum: 15 }, presence: true
  belongs_to :micropost, optional: true

  def self.sweets_categories
    Category.limit(10)
  end

  def self.bread_categories
    Category.limit(7).offset(10)
  end

  def self.other_categories
    Category.offset(17)
  end


end

