class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    Comment.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_to admins_posts_path
  end

  def update
    @comment = Comment.find_by(id: params[:id],post_id: params[:post_id])
    @comment.update(comment_params)
    redirect_to admins_post_path(@comment.post.id)
  end

  def edit
    @comment = Comment.find_by(id: params[:id],post_id: params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id,:post_id,:comment)
  end

end
