class AddIndexToLike < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, :user_id
    add_index :likes, :boke_id
    add_index :likes, [:user_id, :boke_id], unique: true
  end
end
