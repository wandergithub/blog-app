require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  context "Users#index action" do
    it "get 'users' returns OK response status" do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it "Renders index view" do
      get users_path
      expect(response).to render_template(:index)
    end

    it "includes placeholder message" do
      get users_path
      expect(response.body).to include('Here is a list of users')
    end
  end

  context "Users#show action" do
    before :each do
      user = User.new(name: 'Jhon', posts_counter: 0)
      get user_path(1)
    end
    it "get 'users/id returns Ok response status" do
      expect(response).to have_http_status(:ok)
    end

    it "Renders show view" do
      expect(response).to render_template(:show)
    end

    it "Includes placeholder message" do
      expect(response.body).to include('Here is an specific user')
    end
  end
end