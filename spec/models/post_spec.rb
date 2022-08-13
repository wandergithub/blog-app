require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post validation' do
    it 'Raise invalid error when required attributes or author are not provided' do
      expect(Post.new).to be_invalid
      expect(Post.new(title: 'My post')).to be_invalid
      expect(Post.new(title: 'My post', comments_counter: 0)).to be_invalid
      expect(Post.new(title: 'My post', comments_counter: 0, likes_counter: 0)).to be_invalid
      expect(Post.new(author: User.new)).to be_invalid
    end

    it 'Creates the post when all required attributes are provided' do
      expect(Post.new(title: 'My post', comments_counter: 0, likes_counter: 0, author: User.new)).to be_valid
    end

    it 'does not create the post when title exceded the maximum length(250)' do
      expect(Post.new(title: 'My post' * 250, comments_counter: 0, likes_counter: 0, author: User.new)).to be_invalid
    end

    it 'does not allow non integer values for :comments_counter' do
      expect(Post.new(title: 'My post', comments_counter: 'string', likes_counter: 0, author: User.new)).to be_invalid
      expect(Post.new(title: 'My post', comments_counter: 0, likes_counter: 0, author: User.new)).to be_valid
    end

    it 'does not allow non integer values for :likes_counter' do
      expect(Post.new(title: 'My post', comments_counter: 0, likes_counter: 'Not a valid type: string',
                      author: User.new)).to be_invalid
      expect(Post.new(title: 'My post', comments_counter: 0, likes_counter: 0, author: User.new)).to be_valid
    end

    it 'does not allow non integer values for :likes_counter' do
      expect(Post.new(title: 'My post', comments_counter: 0, likes_counter: 'Not a valid type: string',
                      author: User.new)).to be_invalid
      expect(Post.new(title: 'My post', comments_counter: 0, likes_counter: 0, author: User.new)).to be_valid
    end

    it 'Has a a most_recent_comments method' do
      expect(Post.new(title: 'My post', comments_counter: 0, likes_counter: 0,
                      author: User.new).most_recent_comments).to be_truthy
    end
  end
end
