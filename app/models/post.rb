require_relative 'application_record'

class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  after_create :update_post_counter

  # A method which returns the 5 most recent comments for a given post.
  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  # A method that updates the posts counter for a user.
  def update_post_counter
    author.update(posts_counter: 0) if author.posts_counter.nil?
    author.update(posts_counter: author.posts_counter + 1)
  end
end
