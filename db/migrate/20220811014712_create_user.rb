class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.date :updatedAt
      t.date :createdAt
      t.integer :postsCounter
      t.timestamps
    end
  end
end
