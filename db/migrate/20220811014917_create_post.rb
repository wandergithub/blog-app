class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.date :created_at
      t.date :updated_at
      t.integer :comments_counter
      t.integer :likes_counter
    end

    add_foreign_key :posts, :users, column: :author_id

    add_index :posts, :author_id
  end
end
