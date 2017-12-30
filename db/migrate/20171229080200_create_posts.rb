class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.references :topic, index: true, null: false
      t.text :comment

      t.timestamps
    end
    add_index :posts,[:user_id,:topic_id],unique:true
    add_index :posts,[:topic_id,:user_id],unique:true
  end
end
