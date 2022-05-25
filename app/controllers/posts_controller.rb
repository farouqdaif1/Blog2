class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.post.includes(:comment)
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comments = @post.comment
    @likes = @post.like
  end

  def new
    @new_post = Post.new
    render :new
  end

  def create
    @new_post = current_user.post.new(post_params)
    if @new_post.save
      @new_post.updates_posts_counter
      flash[:success] = 'New to-do item successfully added!'
      redirect_to user_posts_url

    else
      flash.now[:error] = 'Post creation failed'
      render :new
    end
  end

  def destroy
    deleted_post = Post.find(params[:id])
    user = User.find(deleted_post.user_id)
    user.posts_counter -= 1
    deleted_post.destroy
    if user.save
      redirect_to user_path(params[:user_id]), notice: 'You have deleted this post successfully!'
    else
      render :new, alert: 'An error has occurred while deleting the post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
