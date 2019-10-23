class AddTitlePictureToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :title, :string
    add_column :microposts, :picture, :string
  end
end
