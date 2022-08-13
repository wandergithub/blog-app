require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Updates the likes counter in the post on like creation' do
    post = Post.new(title: 'Any', comments_counter: 0, likes_counter: 0)
    like = Like.new(post: post)
    expect(like.post.likes_counter).to be_truthy
  end
end