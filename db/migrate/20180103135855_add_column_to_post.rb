class AddColumnToPost < ActiveRecord::Migration
  def up
    add_column :posts, :user_name, :string
  end

  def down
    remove_column :posts, :user_name, :string
  end
end
