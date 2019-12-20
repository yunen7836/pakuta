class CreateBokes < ActiveRecord::Migration[5.2]
  def change
    create_table :bokes do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :boke
      t.timestamps
    end
  end
end
