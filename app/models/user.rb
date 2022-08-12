require_relative 'application_record'

class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  # retunr the 3 most recent posts of the user
  def most_recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end