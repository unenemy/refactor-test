class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.integer :user_id
      t.integer :story_id

      t.timestamps null: false
    end
  end
end
