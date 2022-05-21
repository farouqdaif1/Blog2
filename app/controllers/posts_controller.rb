class PostsController < ApplicationController
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

  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
