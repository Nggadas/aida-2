class AddUserIdToMemosTable < ActiveRecord::Migration[5.0]
  def change
    add_column :memos, :user_id, :integer
  end
end
