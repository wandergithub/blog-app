class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorId
      t.string :title
      t.text :text
      t.date :createdAt
      t.date :UpdatedAt
      t.integer :commentsCounter
      t.integer :likesCounter
      t.timestamps
    end

    add_foreign_key :posts, :users, column: :authorId

    add_index :posts, :authorId
  end
end
