class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :owner_id
      t.string :name,         null: false
      t.date :save_date
      t.text :content

      t.timestamps
    end
      add_index :topics, :owner_id
  end
end
