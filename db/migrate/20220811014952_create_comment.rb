class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorId
      t.integer :postId
      t.text :text
      t.date :updatedAt
      t.date :createdAt
      t.timestamps
    end

    add_foreign_key :comments, :users, column: :authorId
    add_foreign_key :comments, :posts, column: :postId

    add_index :comments, :authorId
    add_index :comments, :postId
  end
end
