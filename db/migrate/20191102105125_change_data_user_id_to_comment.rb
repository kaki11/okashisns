class ChangeDataUserIdToComment < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :comments, :users
    change_column :comments, :user_id, :integer
  end
end
