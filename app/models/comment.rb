require_relative 'application_record'

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_comments_counter_in_post

  private

  # A method that updates the comments counter for a post.
  def update_comments_counter_in_post
    counter = post.comments_counter
    counter.nil? ? post.update(comments_counter: 1) : post.update(comments_counter: counter + 1)
  end
end
