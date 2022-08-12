require_relative 'application_record'

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # A method that updates the comments counter for a post.
  def  update_comments_counter_in_post
    post.comments_counter.nil? ? post.update(comments_counter: 1) : post.update(comments_counter: post.comments_counter + 1)
  end
end