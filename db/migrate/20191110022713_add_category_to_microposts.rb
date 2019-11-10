class AddCategoryToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :category, :string
  end
end
