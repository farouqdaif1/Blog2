class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find_by_id(params[:user_id])
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comments = @post.comment
    @likes = @post.like
  end
end
