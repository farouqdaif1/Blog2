class LikesController < ApplicationController
  def new
    @new_like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @new_like = current_user.like.new
    @new_like.post = @post
    redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
    @new_like.save
    @new_like.updates_likes_counter
  end
end
