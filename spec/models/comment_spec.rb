require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Updates the comments counter in the post on comment creation' do
    author = User.new(name: 'Jhon', photo: 'any', bio: 'super bio',
      posts_counter: 0)
    author.save
    post = Post.new(author: author, title: 'Post Title', text: 'Post Text', comments_counter: 0, likes_counter: 0)
    post.save
    expect(post.comments_counter).to eql 0
    comment = Comment.new(author: author, text: 'Comment Text', post: post)
    comment.save
    expect(post.comments_counter).to eql 1
  end
end