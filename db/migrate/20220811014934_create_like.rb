class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorId
      t.integer :postId
      t.date :createdAt
      t.date :updatedAt
      t.timestamps
    end

    add_foreign_key :likes, :users column: authorId
    add_foreign_key :likes, :posts column: postId

    add_index :likes, :authorId
    add_index :likes, :postId
  end
end
