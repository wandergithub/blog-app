require_relative 'application_record'

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # A method that updates the likes counter for a post.
  def update_likes_counter_in_post
    post.likes_counter.nil? ? post.update(likes_counter: 1) : post.update(likes_counter: post.likes_counter + 1)
  end
end
