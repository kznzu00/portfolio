class Admins::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order(id: "DESC")
  end

  def statistics
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:user_id,:genre_id,:maker_id,:name,:image,:introduction)
  end

end
