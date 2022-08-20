class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.slice(0, 2)
  end

  def show
    @post = User.find(params[:user_id]).posts[params[:id].to_i]
  end
end
