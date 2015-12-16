class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.index :category_id
      t.integer :user_id
      t.index :user_id

      t.timestamps null: false
    end
  end
end
