class Public::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).reverse_order
    @newpost = Post.new
  end

  def create
    @newpost = Post.new(post_params)
    @newpost.user_id = current_user.id
    pp @newpost
    @newpost.save
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id).order(id: "DESC")
  end

  private

  def post_params
    params.require(:post).permit(:user_id,:genre_id,:maker_id,:name,:image,:introduction)
  end

end
