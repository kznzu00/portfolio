class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.integer :maker_id, null: false
      t.string :name, null: false
      t.string :iamge_id, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
