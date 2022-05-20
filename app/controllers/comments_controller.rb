class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new
  end

  def create
    @post = Post.find_by_id(params[:post_id])
    @new_comment = current_user.comment.new(comment_params)
    @new_comment.post = @post
    if @new_comment.save
      @new_comment.updates_comments_counter
      flash[:success] = 'New comment successfully added!'
      redirect_to user_post_path(current_user.id, @post.id)
    else
      flash.now[:error] = 'comment creation failed'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end
