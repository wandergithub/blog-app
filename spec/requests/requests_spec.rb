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
end