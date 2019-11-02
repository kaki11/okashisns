class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :comments, :user_id, :integer, null: true
  end

  def down
    change_column :comments, :user_id, :integer, null: false
  end
end
