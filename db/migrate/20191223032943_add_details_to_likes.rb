class AddDetailsToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :question_id, :integer
  end
end
