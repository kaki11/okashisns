class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :microposts, :category, foreign_key: true
  end
end
