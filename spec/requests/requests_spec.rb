require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  context 'Users#index action' do
    it "get 'users' returns OK response status" do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'Renders index view' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes placeholder message' do
      get users_path
      expect(response.body).to include('Here is a list of users')
    end
  end

  context 'Users#show action' do
    before :each do
      user = User.create(name: 'Jhon', posts_counter: 0)
      get user_path(user.id)
    end
    it "get 'users/id returns Ok response status" do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders show view' do
      expect(response).to render_template(:show)
    end

    it 'Includes placeholder message' do
      expect(response.body).to include('Here is an specific user')
    end
  end

  context 'Posts#index action' do
    before :each do
      user = User.create(name: 'Jhon', posts_counter: 0)
      get "/users/#{user.id}/posts"
    end
    it 'returns ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the right template' do
      expect(response).to render_template(:index)
    end

    it 'includes the placeholder text' do
      expect(response.body).to include(' Here is a list of posts for a given user ')
    end
  end

  context 'Posts#show action' do
    before :each do
      user = User.create(name: 'Jhon', posts_counter: 0)
      post = Post.create(author: user, title: 'post 1', comments_counter: 0, likes_counter: 0)
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'answers with OK response' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes the text placeholder' do
      expect(response.body).to include('Here is an specific post for a given user')
    end
  end
end
