require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validation' do
    it 'Is invalid when :name is not provided' do
      expect(User.new(posts_counter: 0)).to be_invalid
    end

    it 'Is valid when :name is provided' do
      expect(User.new(name: 'carlos', posts_counter: 0)).to be_valid
    end

    it 'Is invalid when :posts_counter is not an integer' do
      expect(User.new(name: 'carlos', posts_counter: 'string')).to be_invalid
    end

    it 'Is invalid when :posts_counter is less than 0' do
      expect(User.new(name: 'carlos', posts_counter: -2)).to be_invalid
    end
  end

  describe '#most_recent_posts' do
    it 'Returns an array  of posts relations' do
      User.create(name: 'carlos', posts_counter: 0)
      expect(User.first.most_recent_posts).to be_truthy
    end
  end
end
